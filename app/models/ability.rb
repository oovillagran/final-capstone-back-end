class Ability
  include CanCan::Ability

  def initialize(user)
    user ||= User.new # guest user (not logged in)
    can :read, :all # permissions for every user, even if not logged in

    can :manage, :all if user.role == 'admin' # additional permissions for administrators

    return unless user.role == 'user' # return unless user is logged in

    can :manage, Reservation, user_id: user.id
  end
end
