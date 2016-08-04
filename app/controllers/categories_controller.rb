class CategoriesController < ApplicationController
  def new
    render locals: {
      category: Category.new
    }
  end

  def create
    category = Category.new
    category.name = params[:category][:name]

    if category.save
      redirect_to actions: "index"
    else
      flash[:alert] = "Category could not be saved."
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
    category.name = params[:category][:name] if params[:category][:name].present?
    if category.saved
      redirect_to user_path(path)
    else
      render templatee: '/category/new.html.erb', locals: {
        category: category
      }
    end
  end

  def destroy
    if Category.exists?(params[:id])
      Category.destroy(params[:id])
      render message: "Category deleted."
    else
      render message: "Category not found."
    end
  end
end
