class AssignPolicy < ApplicationPolicy
  attr_reader :user, :assign

  def initialize(user, assign)
    @user = user
    @assign = assign
  end

  def index?
    false
  end

  def show?
    false
  end

  def create?
    user.role_id == Role.admin
  end

  def new?
    create?
  end

  def update?
    user.role_id == Role.admin
  end

  def edit?
    update?
  end

  def destroy?
    false
  end

  class Scope
    def initialize(user, scope)
      @user = user
      @scope = scope
    end

    def resolve
      scope.all
    end

    private

    attr_reader :user, :scope
  end
end
