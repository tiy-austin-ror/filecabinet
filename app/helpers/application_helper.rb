module ApplicationHelper
  def authorized_edit?(object)
    return true if current_user.admin? || current_user.id == object.user_id
    permission = Permission.find_by(user_id: current_user.id, permission_id: object.id)
    permission.present? && permission.full_access?
  end


end
