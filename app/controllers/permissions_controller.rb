class PermissionsController < ApplicationController
  def destroy
    if permission.user_id.include? current_user.id
        permission.destroy #delete permission given by someone else
        flash[:notice] = "This user no longer has extra permissions."
        redirect_to root_path
    else
      flash[:alert] = "You cannot delete this permission."
      redirect_to root_path
    end
  end
end
