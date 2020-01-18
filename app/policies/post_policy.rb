class PostPolicy < ApplicationPolicy
  def update?
    admin?
  end
end