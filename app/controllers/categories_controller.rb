class CategoriesController < ApplicationController
  def index
    render locals: {
      categories: Category.all
    }
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
      render template: 'category/new.html.erb', locals: {
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
    params.require(:category).permit(:name)
  end
end
