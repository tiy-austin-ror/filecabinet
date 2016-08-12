class DashboardController < ApplicationController
  def index
    if params[:search]
      search_params
    else
      categories = []
      notes = Note.where(user: current_user).order(:updated_at)
      photos = Photo.where(user: current_user).order(:updated_at)
      render locals: { categories: categories, notes: notes, photos: photos }
    end
  end
end
