##
# Ability class defining rules for cancan gem.
#
class Ability
  include CanCan::Ability

  def initialize(user)
    return if user.nil?

    can :manage, Device
    can :manage, Location
    can :manage, User
  end
end
