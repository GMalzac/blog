class ArticlePolicy < ApplicationPolicy
  class Scope < Scope
    def resolve
      scope.all
    end
  end

  def show?
    true
  end

  def create?
    if user.nil?
      false
    else
      user.admin
    end
  end

  def update?
    if user.nil?
      false
    else
      user.admin
    end
  end

  def destroy?
    if user.nil?
      false
    else
      user.admin
    end
  end
end
