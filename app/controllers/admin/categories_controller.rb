class Admin::CategoriesController < ApplicationController
  def index
  end

  def new
  end

  def create
  @category = Category.new(category_params)
  if @category.save
    redirect_to admin_categories_path, notice: 'Category was successfully created.'
  else
    render :new
  end
end

private

def category_params
  params.require(:category).permit(:name)
end

  def edit
  end

  def update
  end

  def destroy
  end
end
