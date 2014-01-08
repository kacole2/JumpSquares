class Ability
  include CanCan::Ability

  def initialize(user)
    # Define abilities for the passed in user here. For example:
    
    user ||= User.new # guest user (not logged in)
       #if user.admin?
       if user.has_role? :admin
         can :manage, :all
       else
         can :index, [Jumpsquare, Tag, Jumpsize, ApptypeRequest, Nmapfile]
         can :create, [Jumpsquare, Tag, ApptypeRequest, Nmapfile]
         can :show, [ApptypeRequest], :apprequestor => user.email
         can :show, [Tag], :tagcreator => user.email
         can :show, [Jumpsquare], :jscreator => user.email
         can :show, [Jumpsize], :jumpsizecreator => user.email
         can :show, [Nmapfile], :nmapfilecreator => user.email
         can :edit, [Tag], :tagcreator => user.email
         can :edit, [Jumpsquare], :jscreator => user.email
         can :edit, [Jumpsize], :jumpsizecreator => user.email
         can :edit, [ApptypeRequest], :apprequestor => user.email
         can :update, [Tag], :tagcreator => user.email
         can :update, [Jumpsquare], :jscreator => user.email
         can :update, [Jumpsize], :jumpsizecreator => user.email
         can :new, [Jumpsquare, Tag, ApptypeRequest, Nmapfile]
         can :destroy, [Tag], :tagcreator => user.email
         can :destroy, [Jumpsquare], :jscreator => user.email
         can :destroy, [Nmapfile], :nmapfilecreator => user.email
         can :createrdpfile, [Jumpsquare]
         can :destroy, User do |u|
            u.id == user.id
         end
         can :read, [Apptype]
        # can :read, :all
       end
    #
    # The first argument to `can` is the action you are giving the user 
    # permission to do.
    # If you pass :manage it will apply to every action. Other common actions
    # here are :read, :create, :update and :destroy.
    #
    # The second argument is the resource the user can perform the action on. 
    # If you pass :all it will apply to every resource. Otherwise pass a Ruby
    # class of the resource.
    #
    # The third argument is an optional hash of conditions to further filter the
    # objects.
    # For example, here the user can only update published articles.
    #
    #   can :update, Article, :published => true
    #
    # See the wiki for details:
    # https://github.com/ryanb/cancan/wiki/Defining-Abilities
  end
end
