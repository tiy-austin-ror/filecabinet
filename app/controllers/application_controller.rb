class ApplicationController < ActionController::Base
  include Clearance::Controller
  protect_from_forgery with: :exception

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
end
