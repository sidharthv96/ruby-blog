class CommentPolicy < ApplicationPolicy
  def destroy?
    admin?
  end
end