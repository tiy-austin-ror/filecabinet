class DashboardController < ApplicationController
  before_action :require_login
  def index
    categories = []
    notes = Note.where(user: current_user)
    photos = Photo.where(user: current_user)
     
    if params[:query]
      categories = Category.where("UPPER(name) LIKE UPPER(?)", "%#{params[:query]}%")

      notes = Note.where("UPPER(name) LIKE UPPER(?)", "%#{params[:query]}%")

      photos = Photo.where("UPPER(name) LIKE UPPER(?)", "%#{params[:query]}%")
    end
    render locals: { categories: categories, notes: notes, photos: photos }
  end
end
