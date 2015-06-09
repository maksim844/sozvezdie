class AddSuperadmin < ActiveRecord::Migration
  def up
    user = User.new(email: 'superadmin@ieml.ru', password: 'superadmin', password_confirmation: 'superadmin', is_admin: true, roles: 'admin')
    user.save!
  end

  def down
  end
end
