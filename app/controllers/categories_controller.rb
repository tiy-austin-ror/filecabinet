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
      redirect_to category_path(path)
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
  def category_params
    params.require(:category).permit(:name)
  end
end
