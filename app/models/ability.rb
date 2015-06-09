class Ability
  include CanCan::Ability
  def initialize(user)
    can :read, :all                   # allow everyone to read everything
    if user && user.is_admin?
      can :access, :rails_admin       # only allow admin users to access Rails Admin
      can :dashboard                  # allow access to dashboard
      if user.role? :admin
        can :manage, :all             # allow superadmins to do anything
      elsif user.role? :moderator
        can :manage, [Article, News, Teacher]  # allow managers to do anything to products and users
      elsif user.role? :viewer
        can :read, :all
      end
    end
  end
end