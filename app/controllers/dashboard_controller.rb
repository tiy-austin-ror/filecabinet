class DashboardController < ApplicationController
  def index
    if params[:search]
      categories = Category.where("name ~* '.*#{params[:search]}.*'")
      notes = Note.where("name ~* '.*#{params[:search]}.*'").order(:updated_at)
      photos = Photo.where("name ~* '.*#{params[:search]}.*'").order(:updated_at)
      users = User.where("name ~* '.*#{params[:search]}.*'").order(:name)
      tags = Tag.where("name ~* '.*#{params[:search]}.*'")
    else
      categories = []
      notes = Note.where(user: current_user)
      photos = Photo.where(user: current_user)
    end
    render locals: { categories: categories, notes: notes, photos: photos, users: users, tags: tags }
  end
end
