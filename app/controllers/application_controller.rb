class ApplicationController < ActionController::Base
  include Clearance::Controller
  protect_from_forgery with: :exception

  def restrict_non_auth(redirect_path)
    unless note.user_id == current_user.id || current_user.admin?
      flash[:alert] = "You do not have permission to view this page."
      redirect_to redirect_path
    end
  end
end
