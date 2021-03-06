class PhotosController < ApplicationController
  def index
    if params[:search]
      search_params
    else
      photos = Photo.all
      render locals: { photos: photos.select{ |photo| current_permission?(photo) }.order(:updated_at) }
    end
  end

  def show
    photo = Photo.find(params[:id])
    if photo
      if current_permission?(photo)
        if params[:search]
          search_params
        else
          render locals: { photo: photo, permission: Permission.new }
        end
      else
        flash[:alert] = "You do not have permission to view this page."
        redirect_to root_path
      end
    else
      render html: 'Photo not found', status: 404
    end
  end

  def new
    if params[:search]
      search_params
    else
      render locals: { photo: Photo.new }
    end
  end

  def create
    photo = current_user.photos.build(photo_params)
    if photo.save
      Tagging.create_tags(photo, params)
      redirect_to photo
    else
      flash[:alert] = "Photo could not be created: #{photo.errors.full_messages}"
      render :new, locals: { photo: photo }
    end
  end

  def edit
    if params[:search]
      search_params
    else
      render locals: { photo: Photo.find(params[:id]) }
    end
  end

  def update
    photo = Photo.find(params[:id])
    if has_permission?(photo)
      if photo
        if photo.update(photo_params)
          Tagging.update_tags(photo, params)
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
    if has_permission?(photo)
      if photo
        photo.destroy
        flash[:notice] = "Photo deleted"
        redirect_to photos
      else
        flash[:alert] = photo.errors
      end
    else
      flash[:alert] = "You do not have permission to delete this photo."
      redirect_to root_path
    end
  end

  private
  def photo_params
    params.require(:photo).permit(:user_id, :category_id, :name, :desc, :upload)
  end
end
