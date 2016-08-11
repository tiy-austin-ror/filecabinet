class MembersController < ApplicationController
  def new
    render locals: { member: Member.new }
  end

  def create
    member = Member.new(member_params)
    if current_user && current_user.admin?
      if member.save
        redirect_to :back
      else
        render :new, locals: { member: member }
      end
    else
      flash[:alert] = "You do not have permission to add members."
    end
  end

  def destroy
    member = Member.find(params[:id])
    if current_user.admin?
      if member
        member.destroy
        flash[:notice] = "This user is no longer a member of this team."
      else
        flash[:alert] = member.errors
      end
      redirect_to :back
    else
      flash[:alert] = "You do not have permission to remove members."
    end
  end
end

private

def member_params
  params.require(:member).permit(:user_id, :team_id)
end
