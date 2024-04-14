class AppliedInstrumentPolicy < ApplicationPolicy
  class Scope < Scope
    def resolve
      scope.all if user.psychologist?
    end
  end

  def new?
    user.psychologist?
  end

  def create?
    user.psychologist?
  end

  def show?
    true
  end
end
