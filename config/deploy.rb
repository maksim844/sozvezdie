# -*- encoding : utf-8 -*-
#set :application, "set your application name here"
#set :repository,  "set your repository location here"

#set :scm, :subversion
# Or: `accurev`, `bzr`, `cvs`, `darcs`, `git`, `mercurial`, `perforce`, `subversion` or `none`

#role :web, "your web-server here"                          # Your HTTP server, Apache/etc
#role :app, "your app-server here"                          # This may be the same as your `Web` server
#role :db,  "your primary db-server here", :primary => true # This is where Rails migrations will run
#role :db,  "your slave db-server here"

####FROM HABRA
require 'rvm/capistrano' # Для работы rvm
require 'bundler/capistrano' # Для работы bundler. При изменении гемов bundler автоматически обновит все гемы на сервере, чтобы они в точности соответствовали гемам разработчика. 

set :application, "dummy_app"
set :rails_env, "production"

#set :domain, "deployer@79.143.190.205" # Это необходимо для деплоя через ssh. Именно ради этого я настоятельно советовал сразу же залить на сервер свой ключ, чтобы не вводить паролей.
set :domain, "deployer@84.18.102.4"
set :deploy_to, "/var/www/#{application}"
set :use_sudo, false
set :unicorn_conf, "#{deploy_to}/current/config/unicorn.rb"
set :unicorn_pid, "#{deploy_to}/shared/pids/unicorn.pid"

set :rvm_ruby_string, 'ruby-2.1.1' # Это указание на то, какой Ruby интерпретатор мы будем использовать.
#set :rvm_bin_path, "/usr/local/rvm/bin"

set :scm, :git # Используем git. Можно, конечно, использовать что-нибудь другое - svn, например, но общая рекомендация для всех кто не использует git - используйте git. 
#set :repository,  "git@github.com:maksim844/sozvezdie.git" # Путь до вашего репозитария. Кстати, забор кода с него происходит уже не от вас, а от сервера, поэтому стоит создать пару rsa ключей на сервере и добавить их в deployment keys в настройках репозитария.
set :repository,  "https://github.com/maksim844/sozvezdie.git"

set :branch, "master" # Ветка из которой будем тянуть код для деплоя.
set :deploy_via, :remote_cache # Указание на то, что стоит хранить кеш репозитария локально и с каждым деплоем лишь подтягивать произведенные изменения. Очень актуально для больших и тяжелых репозитариев.
set :keep_releases, 5

role :web, domain
role :app, domain
role :db,  domain, :primary => true
before 'deploy:setup', 'rvm:install_rvm', 'rvm:install_ruby' # интеграция rvm с capistrano настолько хороша, что при выполнении cap deploy:setup установит себя и указанный в rvm_ruby_string руби.

#before 'deploy:update_code' do
# puts "Cleaning up old assets..."
#run "rm -rf #{deploy_to}/shared/assets/*.css"
# run "rm -rf #{deploy_to}/shared/assets/*.css.gz"
# run "rm -rf #{deploy_to}/shared/assets/*.js"
# run "rm -rf #{deploy_to}/shared/assets/*.js.gz"
# run "rm -rf #{deploy_to}/shared/assets/*.png"
# run "rm -rf #{deploy_to}/shared/assets/*.jpg"
# run "rm -rf #{deploy_to}/shared/assets/application"
#run "rm -rf #{deploy_to}/shared/assets/active_admin"
#run "rm -rf #{deploy_to}/shared/assets/iconza"
#end

# Далее идут правила для перезапуска unicorn. Их стоит просто принять на веру - они работают.
# В случае с Rails 3 приложениями стоит заменять bundle exec unicorn_rails на bundle exec unicorn

load 'deploy/assets' # assets:precompile etc
namespace :deploy do
  namespace :db do
    task :create do
      run %Q{cd #{current_release} && #{rake} RAILS_ENV=#{rails_env} db:create}
    end
    task :migrate do
      run %Q{cd #{current_release} && #{rake} RAILS_ENV=#{rails_env} db:migrate:reset}
    end
    task :populate do
      run %Q{cd #{current_release} && #{rake} RAILS_ENV=#{rails_env} db:populate}
    end
  end
  namespace :user do
    task :bundle do
      run %Q{cd #{current_release} && bundle install}
    end
  end

  namespace :assets do
    task :precompile, :roles => :web, :except => { :no_release => true } do
      from = source.next_revision(current_revision)
      if capture("cd #{latest_release} && #{source.local.log(from)} vendor/assets/ app/assets/ lib/assets | wc -l").to_i > 0
        run %Q{cd #{latest_release} && #{rake} RAILS_ENV=#{rails_env} #{asset_env} assets:precompile}
      else
        logger.info "Skipping asset pre-compilation because there were no asset changes"
      end
    end

    task :clean, :roles => :web, :except => { :no_release => true } do
      run "cd #{latest_release} && #{rake} RAILS_ENV=#{rails_env} #{asset_env} assets:clean"
    end
  end
  task :restart do
    run "if [ -f #{unicorn_pid} ] && [ -e /proc/$(cat #{unicorn_pid}) ]; then kill -USR2 `cat #{unicorn_pid}`; else cd #{deploy_to}/current && bundle exec unicorn -c #{unicorn_conf} -E #{rails_env} -D; fi"
  end
  task :start do
    run "cd #{deploy_to}/current && bundle exec unicorn -c #{unicorn_conf} -E #{rails_env} -D"
  end
  task :stop do
    run "if [ -f #{unicorn_pid} ] && [ -e /proc/$(cat #{unicorn_pid}) ]; then kill -QUIT `cat #{unicorn_pid}`; fi"
  end

end
