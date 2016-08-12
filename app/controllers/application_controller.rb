class ApplicationController < ActionController::Base
  before_action :require_login

  include Clearance::Controller
  protect_from_forgery with: :exception

  def disable_search
    @disable_search = true
  end

  def has_permission?(obj)
    [
      current_user.admin?,
      obj.users_with_access.include?(current_user),
      obj.respond_to?(:user_id) && obj.user_id == current_user.id
    ].any?
  end
  helper_method :has_permission?

  def authorized_any?(array)
    return true if array.any?{ |item| has_permission?(item) }

    array.empty?
  end
  helper_method :authorized_any?

  def current_permission?(obj)
    parents = (obj.category.ancestors << obj.category)
    return true if category_permission?(parents)

    has_permission?(obj)
  end

  def category_permission?(categories)
    categories.any? { |c| has_permission?(c) }
  end

  def search_params
    categories = Category.search(params[:search])
    notes = Note.search(params[:search]).order(:updated_at)
    photos = Photo.search(params[:search]).order(:updated_at)
    users = User.search(params[:search]).order(:name)
    tags = Tag.search(params[:search])
    render template: 'dashboard/index.html.erb', locals: { categories: categories, notes: notes, photos: photos, users: users, tags: tags }
  end
end
