class PhotosController < ApplicationController
  def index
    photos = Photo.all
    render locals: { photos: photos }
  end

  def show
    photo = Photo.find(params[:id])
    if photo
      render locals: { photo: photo }
    else
      render html: 'Photo not found', status: 404
    end
  end

  def new
    render locals: { photo: Photo.new }
  end

  def create
    photo = Photo.new(photo_params)
    if photo.save
      redirect_to photo
    else
      render :new, locals: { photo: photo }
    end
  end

  def edit
    render locals: { photo: Photo.find(params[:id]) }
  end

  def update
    photo = Photo.find(params[:id])
    if photo
      if photo.update(photo_params)
        redirect_to photo
      else
        render :edit
      end
    else
      render html: 'Photo not found', status: 404
    end
  end

  def destroy
    photo = Photo.find(params[:id])
    if photo
      photo.destroy
      flash[:notice] = "Photo deleted"
      redirect_to photos
    else
      flash[:alert] = photo.errors
    end
  end

  private
  def photo_params
    params.require(:photo).permit(:user_id, :category_id, :name, :desc, :upload)
  end
end
