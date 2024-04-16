class ProductsController < ApplicationController
  before_action :load_categories, only: [:index]
  before_action :set_product, only: [:show]

  def index
    @products = Product.all
    @products = @products.where(category_id: params[:category_id]) if params[:category_id].present?
    @products = @products.newly_added if params[:filter] == 'new'
    @products = @products.recently_updated if params[:filter] == 'updated'
    @products = @products.search(params[:search]) if params[:search].present?
    @products = @products.order(created_at: :desc).paginate(page: params[:page], per_page: 5)
  end

  def show
  end

  private

  def set_product
    @product = Product.find(params[:id])
  end

  def load_categories
    @categories = Category.all
  end
end
