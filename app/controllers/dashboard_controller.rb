class DashboardController < ApplicationController
  def index
    if params[:search]
      categories = Category.search(params[:search])
      notes = Note.search(params[:search]).order(:updated_at)
      photos = Photo.search(params[:search]).order(:updated_at)
      users = User.search(params[:search]).order(:name)
      tags = Tag.search(params[:search])
    else
      categories = []
      notes = Note.where(user: current_user).order(:updated_at)
      photos = Photo.where(user: current_user).order(:updated_at)
    end
    render locals: { categories: categories, notes: notes, photos: photos, users: users, tags: tags }
  end
end
