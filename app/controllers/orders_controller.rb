class OrdersController < ApplicationController
  before_action :authenticate_user!  # Ensures that the user is logged in

  def index
    @orders = Order.where(user_id: current_user.id)
  end

  def show
    @order = Order.find(params[:id])
    # Ensure the current user owns the order or is an admin
    redirect_to root_path, alert: "Access denied" unless @order.user == current_user || current_user.admin?
  end
end
