class DashboardController < ApplicationController
  before_action :require_login
<<<<<<< HEAD
=======
  def index
    if params[:query]
      categories = Category.where("UPPER(name) LIKE UPPER(?)", "%#{params[:query]}%")

      notes = Note.where("UPPER(name) LIKE UPPER(?)", "%#{params[:query]}%")

      photos = Photo.where("UPPER(name) LIKE UPPER(?)", "%#{params[:query]}%")
    end
    render locals: { categories: categories, notes: notes, photos: photos }
  end

>>>>>>> 9c90dc4a642fa9f3cca24eead512759773c3e08d
end
