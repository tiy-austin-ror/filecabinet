class PhotosController < ApplicationController
  def index
    photos = Photo.all
    if has_permission?(photos)
      render locals: { photos: photos }
    else
      flash[:alert] = "You do not have permission to view this page."
      redirect_to root_path
    end
  end

  def show
    photo = Photo.find(params[:id])
    if has_permission?(photo)
      if photo
        render locals: { photo: photo }
      else
        render html: 'Photo not found', status: 404
      end
    else
      flash[:alert] = "You do not have permission to view this page."
      redirect_to root_path
    end
  end

  def new
    render locals: { photo: Photo.new }
  end

  def create
    photo = current_user.photos.build(photo_params)
    if photo.save
      redirect_to photo
    else
       flash[:alert] = photo.errors.full_messages[0]
      render :new, locals: { photo: photo }
    end
  end

  def edit
    render locals: { photo: Photo.find(params[:id]) }
  end

  def update
    photo = Photo.find(params[:id])
    if has_permission?(photo)
      if photo
        if photo.update(photo_params)
          redirect_to photo
        else
          flash[:alert] = photo.errors.full_messages[0]
          render :edit
        end
      else
        render html: 'Photo not found', status: 404
      end
    else
      flash[:alert] = "You do not have permission to view this page."
      redirect_to root_path
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

  def has_permission?(photos)
    Photo.user_id == current_user.id || current_user.admin?
  end
end
