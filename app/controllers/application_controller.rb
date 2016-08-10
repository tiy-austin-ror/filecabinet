class ApplicationController < ActionController::Base
  include Clearance::Controller
  protect_from_forgery with: :exception

  def has_permission?(obj)
    obj.user_id == current_user.id || current_user.admin? || obj.users_with_access.include?(current_user)
  end

  def current_permission?(obj)
    parents = [obj.category.ancestors, obj.category].flatten
    parents.each do |parent|
      if has_permission?(parent)
        return true
      end
    end

    if has_permission?(photo)
      return true
    end
  end
end
