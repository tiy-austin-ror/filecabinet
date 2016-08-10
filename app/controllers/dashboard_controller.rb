class DashboardController < ApplicationController
  before_action :require_login
  def index
    if params[:query]
      categories = Category.where("name ~* '.*#{params[:query]}.*'")
      notes = Note.where("name ~* 'note: .*#{params[:query]}.*'")
      photos = Photo.where("name ~* '.*#{params[:query]}.*'")
      users = User.where("name ~* '.*#{params[:query]}.*'")
      tags = Tag.where("name ~* '.*#{params[:query]}.*'")

    end
    render locals: { categories: categories, notes: notes, photos: photos, users: users, tags: tags }
  end

end
