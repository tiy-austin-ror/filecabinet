class DashboardController < ApplicationController
  def index
    if params[:query]
      categories = Category.where("name ~* '.*#{params[:query]}.*'")
      notes = Note.where("name ~* '.*#{params[:query]}.*'").order(:updated_at)
      photos = Photo.where("name ~* '.*#{params[:query]}.*'").order(:updated_at)
      users = User.where("name ~* '.*#{params[:query]}.*'").order("created_at DESC")
      tags = Tag.where("name ~* '.*#{params[:query]}.*'")
    else
      categories = []
      notes = Note.where(user: current_user)
      photos = Photo.where(user: current_user)
    end
    render locals: { categories: categories, notes: notes, photos: photos, users: users, tags: tags }
  end
end
