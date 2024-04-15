class UserPolicy < ApplicationPolicy
  class Scope < Scope
    # NOTE: Be explicit about which records you allow access to!
    def resolve
      scope.all if user.psychologist?
    end
  end

  def profile?
    true
  end

  def check_info?
    true
  end

  def checked?
    true
  end
end
