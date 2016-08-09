class DashboardController < ApplicationController
  before_action :require_login
  def index
    render locals: {
      notes: Note.where(user: current_user)
    }
  end
end
