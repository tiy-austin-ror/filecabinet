class SearchController < ApplicationController
  def search
    if params[:search]
      categories = Category.where("name ~* '.*#{params[:search]}.*'")
      notes = Note.where("name ~* '.*#{params[:search]}.*'").order(:updated_at)
      photos = Photo.where("name ~* '.*#{params[:search]}.*'").order(:updated_at)
      users = User.where("name ~* '.*#{params[:search]}.*'").order("created_at DESC")
      tags = Tag.where("name ~* '.*#{params[:search]}.*'")
    else
      categories = []
      notes = Note.where(user: current_user)
      photos = Photo.where(user: current_user)
    end
    render "shared/_nav.html.erb", locals: { categories: categories, notes: notes, photos: photos, users: users, tags: tags }
  end
end
