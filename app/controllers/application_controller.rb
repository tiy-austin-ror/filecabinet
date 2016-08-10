class ApplicationController < ActionController::Base
  include Clearance::Controller
  protect_from_forgery with: :exception

  def has_permission?(obj)
    if current_user.admin? || obj.users_with_access.include?(current_user)
      return true
    elsif obj.respond_to?(:user_id)
      obj.user_id == current_user.id
    end
  end

  def current_permission?(obj)
    parents = (obj.category.ancestors << obj.category)
    return true if category_permission?(parents)

    has_permission?(obj)
  end

  def category_permission?(categories)
    categories.any? { |c| has_permission?(c) }
  end
end
