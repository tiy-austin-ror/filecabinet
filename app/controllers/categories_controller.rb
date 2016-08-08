class CategoriesController < ApplicationController
  def index
    render locals: {
      #the following prevents nested categories from appearing on the index page
      categories: Category.all.where(parent_category_id: nil)
    }
  end

  def show
    category = Category.find_by(parent_category_id: params.fetch(:id))
    categories = Category.where(parent_category_id: params.fetch(:id))
    notes = Note.where(category_id: params.fetch(:id))
    photos = Photo.where(category_id: params.fetch(:id))

    if category
      render locals: {
        category: category,
        categories: categories,
        notes: notes,
        photos: photos }
    else
      redirect_to categories_path
    end
  end

  def new
    render locals: {
      category: Category.new
    }
  end

  def create
    category = Category.new(category_params)
    if category.save
      redirect_to category
    else
      flash[:alert] = category.errors
      render template: 'categories/new.html.erb', locals: {
        category: category
      }
    end
  end

  def edit
    render locals: {
      category: Category.find(params[:id])
    }
  end

  def update
    category = Category.find(params[:id])
    if category.update(category_params)
      redirect_to category
    else
      render templatee: '/category/new.html.erb', locals: {
        category: category
      }
    end
  end

  def destroy
    category = Category.find(id :params[id])
    if category.destroy
      render message: "Category deleted."
    else
      render message: "Category not found."
    end
  end

  private
  def category_params
    params.require(:category).permit(:name, params[:parent_category_id])
  end
end
