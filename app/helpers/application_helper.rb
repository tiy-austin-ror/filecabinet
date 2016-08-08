module ApplicationHelper
  def authorized?(object)
    object.user_id == current_user.id || current_user.admin?
  end
end
