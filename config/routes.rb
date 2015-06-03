DummyApp::Application.routes.draw do

  mount Rich::Engine => '/rich', :as => 'rich'

  mount RailsAdmin::Engine => '/admin', :as => 'rails_admin'

  resources :nodes
  get 'nodes/:section/:page' => 'nodes#show'
 # get 'nodes/show/:id/:url' => 'nodes#show', as: :node_page
  resources :news
  get ':section/news/' => 'news#index', as: :news
  get ':section/news/:id' => 'news#show' , as: :news_show
  get 'news/:section/all' => 'news#all', as: :all_news

  resources :picturealbums
  get ':section/picturealbum/' => 'picturealbums#index', as: :picturealbum
  get ':section/picturealbum/:id' => 'picturealbums#show' , as: :picturealbum_show

  resources :teachers
  get ':section/teachers/' => 'teachers#index', as: :teacher
  get ':section/teacher/:id' => 'teachers#show' , as: :teacher_show

  resources :articles
  get ':section/articles/' => 'articles#index', as: :article
  get ':section/article/:id' => 'articles#show' , as: :article_show

  resources :guests
  get ':section/guests/' => 'guests#index', as: :guest
  get ':section/guest/:id' => 'guests#show' , as: :guest_show

  resources :albums

  get 'welcome/:section'=>'welcome#show', as: :welcome_show
  devise_for :users
  root :to => "welcome#academy"

  # https://github.com/sferik/rails_admin/issues/362
  match ':controller(/:action(/:id(.:format)))'
end
