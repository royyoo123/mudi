class EventPolicy < ApplicationPolicy
  class Scope < Scope
    def resolve
      scope
    end
  end
  def create?
  	user.business_owner
  end

  def show?
  	true
  end
  def confirmation?
    true
  end
  def confirmed?
    true
  end
  def map?
    true
  end
  def edit?
    record.user == user
  end
  def update?
    record.user == user
  end
  def destroy?
    record.user == user
  end
end
