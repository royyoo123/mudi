class EventPolicy < ApplicationPolicy
  class Scope < Scope
    def resolve
      scope.all
    end
  end

  def create?
  	user.business_owner
  end

  def show?
  	true
  end
  
end
