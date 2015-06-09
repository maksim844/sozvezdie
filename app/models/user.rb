class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :token_authenticatable, :confirmable, :lockable and :timeoutable
  devise :database_authenticatable, :registerable, :recoverable, :rememberable, :trackable, :validatable

  serialize :roles, Array
  def roles_enum
    [ [ 'Полный доступ', 'admin' ], [ 'Редактор', 'moderator' ], [ 'Только просмотр', 'viewer' ] ]
  end
  # Setup accessible (or protected) attributes for your model
  attr_accessible :email, :password, :password_confirmation, :remember_me, :roles, :avatar, :is_admin


  # Add Paperclip support for avatars
  has_attached_file :avatar, :styles => { :medium => "300x300>", :thumb => "100x100>" },
                    :default_url => "/images/:style/missing.png",
                    :url => "/system/:class/:style/:basename.:extension"
  def attr_accessible_role
    :custom_role
  end

  attr_accessor :delete_avatar
  before_validation { self.avatar = nil if self.delete_avatar == '1' }

  def role?(role)
    roles.include?(role.to_s)
  end
end
