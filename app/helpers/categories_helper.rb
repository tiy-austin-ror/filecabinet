module CategoriesHelper
  def item_count(category)
    pluralize(category.children.count + category.notes.count + category.photos.count, 'item')
  end
end
