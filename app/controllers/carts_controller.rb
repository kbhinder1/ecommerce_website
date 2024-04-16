class CartsController < ApplicationController
  before_action :initialize_cart

  def show
  end

  def add_item
    id = params[:product_id].to_i
    quantity = params[:quantity].to_i

    session[:cart][id] = (session[:cart][id] || 0) + quantity

    redirect_to cart_path
  end

  def remove_item
    id = params[:product_id].to_i
    session[:cart].delete(id)

    redirect_to cart_path
  end

  def update_item
    id = params[:product_id].to_i
    quantity = params[:quantity].to_i

    if quantity > 0
      session[:cart][id] = quantity
    else
      session[:cart].delete(id)
    end

    redirect_to cart_path
  end

  private

  def initialize_cart
    session[:cart] ||= {}
  end
end
