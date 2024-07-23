# frozen_string_literal: true

class PostPolicy < ApplicationPolicy
  def update?
    record.user_id == user.id
  end
 
  def destroy?
    record.user_id == user.id
  end
end
