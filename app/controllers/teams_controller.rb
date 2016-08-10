class TeamsController < ApplicationController
  def index
    if params[:query]
      teams = Team.where("UPPER(name) LIKE UPPER(?)", "%#{params[:query]}%")
    else
      teams = Team.all
    end
    render locals: { teams: teams }
  end

  def show
  team = Team.find(params[:id])
    if team
      render locals: { team: team }
    else
      render html: 'Team not found', status: 404
    end
  end

  def new
    render locals: { team: Team.new }
  end

  def create
    team = Team.new(team_params)
    if current_user && current_user.admin?
    else
      flash[:alert] = "You do not have permission to create teams."
      if team.save
        redirect_to team
      else
        render :new, locals: { team: team }
      end
    end
  end

  def edit
    render locals: { team: Team.find(params[:id]) }
  end

  def update
    team = Team.find(params[:id])
    if current_user.admin?
      if team
        if team.update(team_params)
          redirect_to team
        else
          flash[:alert] = team.errors.full_messages[0]
          render :edit
        end
      else
        render html: 'Photo not found', status: 404
      end
    else
      flash[:alert] = "You do not have permission to update teams."
      redirect_to root_path
    end
  end

  def destroy
    team = Team.find(params[:id])
    if current_user.admin?
      if team
        team.destroy
        flash[:notice] = "Team deleted"
        redirect_to teams
      else
        flash[:alert] = team.errors
      end
    else
      flash[:alert] = "You do not have permission to delete teams."
      redirect_to root_path
    end
  end

  private
  def team_params
    params.require(:team).permit(:user_id, :name)
  end
end
