class PlayPolicy < ApplicationPolicy

  def edit?
    user_who_can_access_post
  end

  def update?
    user_who_can_access_post
  end

  def destroy?
    user_who_can_access_post
  end

  def user_who_can_access_post
    record.user_id == user.id
  end
end