class PermissionsController < ApplicationController
  def new
    render locals: { permission: Permission.new }
  end

  def create
    permission = Permission.new(permission_params)
    unless permission.save
      flash[:alert] = permission.errors.full_messages[0]
    end
    redirect_to :back
  end

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

private
def permission_params
  params.require(:permission).permit(:permission_id, :permission_type, :full_access, :user_id)
end
