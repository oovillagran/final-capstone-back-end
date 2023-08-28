class Ability
  include CanCan::Ability

  def initialize(user)
    user ||= User.new # guest user (not logged in)
    can :read, Doctor # permissions for every user, even if not logged in

    can :manage, :all if user.role == 'admin' # additional permissions for administrators

    return unless user.role == 'user' # return unless user is logged in
    can :manage, Doctor, user_id: user.id
    can :manage, User, id: user.id
    can :manage, Reservations, user_id: user.id
  end
end
