class ApplicationController < ActionController::Base
  include Clearance::Controller
  protect_from_forgery with: :exception

  def restrict_non_admin(redirect_path)
    unless admin_user?
      flash[:alert] = "You do not have permission to view this page."
      redirect_to redirect_path
    end
  end
end
