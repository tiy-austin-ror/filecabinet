class DashboardController < ApplicationController
  def index
    categories = []
    notes = Note.where(user: current_user)
    photos = Photo.where(user: current_user)
    render locals: { categories: categories, notes: notes, photos: photos }
  end

end
