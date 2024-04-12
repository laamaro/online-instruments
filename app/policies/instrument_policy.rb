class InstrumentPolicy < ApplicationPolicy
  class Scope < Scope
    def resolve
      scope.all if user.psychologist?
    end
  end

  def show?
    user.psychologist?
  end
end
