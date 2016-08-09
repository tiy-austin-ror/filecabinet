class Tagging < ApplicationRecord
  belongs_to :tag
  belongs_to :note, polymorphic: true, optional: true
  belongs_to :photo, polymorphic: true, optional: true
<<<<<<< HEAD


  def self.update_tags(obj, params)
    obj.taggings.each do |t|
      next if self.current_tags(params).include? t.tag.name
      t.destroy
    end
    create_tags(obj, params)
  end

  def self.create_tags(obj, params)
    self.current_tags(params).each do |tag|
      next if tag.blank?
      t = Tag.find_or_create_by(name: tag)
      Tagging.find_or_create_by(tag: t, taggable_type: obj.class, taggable_id: obj.id)
    end
  end

  private

  def self.current_tags(params)
    params["tags"]["name"].split(",").map do |t|
      t.strip.downcase
    end
  end
=======
>>>>>>> 9c90dc4a642fa9f3cca24eead512759773c3e08d
end
