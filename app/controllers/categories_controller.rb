class CategoriesController < ApplicationController
  before_action :disable_search

  def index
    if params[:search]
      categories = Category.where("name ~* '.*#{params[:search]}.*'")
    else
      categories = Category.all.where(parent_category_id: nil)
    end
    render locals: { categories: categories }
  end

  def show
    category = Category.find(params.fetch(:id))
    if category
      render locals: { category: category }
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
    params.require(:category).permit(:name, :parent_category_id, :user_id)
  end
end
