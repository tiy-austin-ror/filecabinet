class DashboardController < ApplicationController
  before_action :require_login
  def index
    if params[:query]
      categories = Category.where("name ~* '.*#{params[:query]}.*'")
      notes = Note.where("name ~* '.*#{params[:query]}.*'").order(:updated_at)
      photos = Photo.where("name ~* '.*#{params[:query]}.*'").order(:updated_at)
      users = User.where("name ~* '.*#{params[:query]}.*'").order("created_at DESC")
      tags = Tag.where("name ~* '.*#{params[:query]}.*'")
    end
    render locals: { categories: categories, notes: notes, photos: photos, users: users, tags: tags }
  end
end
