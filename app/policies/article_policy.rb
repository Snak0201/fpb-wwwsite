class ArticlePolicy < ApplicationPolicy
  def read
    user == Admin.first
  end

  def write
    false
  end

  class Scope < Scope
    # NOTE: Be explicit about which records you allow access to!
    # def resolve
    #   scope.all
    # end
  end
end
