class Ability
    include CanCan::Ability

    def initialize(user)
        user ||= User.new

        if user.role? :webmaster then
            can :manage, :all
        else
            can :index, Project
            can :show, Project

            can :index, Tag
            can :show, Tag
        end
    end
end