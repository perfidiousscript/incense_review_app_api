class Ability
  include CanCan::Ability

  def initialize(user)
      can :index, :all
      can :show, :all
      can :incenses, :all
      if user.present?
        can [:new, :create], [Incense, Line, Brand, Review]
        if user.admin?
          can :manage, :all
        end
      end
  end
end
