class ApplicationRecord < ActiveRecord::Base
  self.abstract_class = true

  # def order(object)
  #   joins("left join notes on notes.user_id = user.id")
  #   .group("user.id, user.name")
  #   .order("count(notes.id")
  # end
end
