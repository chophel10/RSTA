class ComplainPolicy < ApplicationPolicy
  attr_reader :user, :complain

  def initialize(user, complain)
    @user = user
    @complain = complain
  end

  def index?
    true
  end

  def show?
    true2
  end

  def create?
    if  user.role_id == Role.admin ||  user.role_id == Role.customercare
      false
    else
     true
    end
    # !user.admin && !user.customer_care 
  end

  def new?
    create?
  end

  def update?
    if  user.role_id == Role.admin
      true
    elsif  user.role_id == Role.customercare
      true
    elsif user.id == complain.user_id
      true
    end
    false
  end

  def edit?
    update?
  end

  def destroy?
     user.role_id == Role.admin || user.id == complain.user_id 
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
