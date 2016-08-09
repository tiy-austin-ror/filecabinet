class PhotosController < ApplicationController
  def index
    if params[:query]
      photos = Photo.where("UPPER(name) LIKE UPPER(?)", "%#{params[:query]}%")
    else
      photos = Photo.all
    end
    render locals: { photos: photos }
  end

  def show
    photo = Photo.find(params[:id])
    if has_permission?(photo)
      if photo
        render locals: { photo: photo, permission: Permission.new }
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
      params["tags"]["name"].split(",").each do |tag|
        next if tag.blank?
        t = Tag.find_or_create_by(name: tag.strip.downcase)
        Tagging.find_or_create_by(tag: t, taggable_type: photo.class, taggable_id: photo.id)
      end
      redirect_to photo
    else
      flash[:alert] = "Photo could not be created: #{photo.errors.full_messages}"
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

  def has_permission?(photo)
    photo.user_id == current_user.id || current_user.admin? || photo.users_with_access.include?(current_user)
  end
end
