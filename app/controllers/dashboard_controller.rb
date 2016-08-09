class DashboardController < ApplicationController
  before_action :require_login
  def index
    render locals: {
      
    }
  end
end
