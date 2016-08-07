class PermissionsController < ApplicationController
  def destroy
    if has_permission?
        permission.destroy #delete permission given by someone else
        flash[:notice] = "This user no longer has extra permissions."
        redirect_to root_path
    else
      flash[:alert] = "You cannot delete this permission."
      redirect_to root_path
    end
  end

  private
  def has_permission?(object)
    object.user_id == current_user.id || current_user.admin?
  end
end
