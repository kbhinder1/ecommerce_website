class CheckoutController < ApplicationController
  before_action :authenticate_user!
  before_action :ensure_user_address_present, only: :create

  def show
    # Optionally, display information about the cart or simply the checkout form.
    redirect_to new_user_session_path and return unless user_signed_in?
  end

  def create
    order = nil  # Declare `order` outside the transaction block to widen its scope

    ActiveRecord::Base.transaction do
      total = calculate_total
      order = Order.create!(user: current_user, status: 'pending', total: total)

      session[:cart].each do |product_id, quantity|
        product = Product.find(product_id)
        OrderItem.create!(order: order, product: product, quantity: quantity, price: product.price)
      end

      # Clear the cart after the order is successfully created
      session[:cart] = {}
    end

    # Check if the order was created and redirect accordingly
   if order&.persisted?
  # Redirect to a confirmation page with success message
  redirect_to order_path(order), notice: 'Your order has been placed successfully.'
else
  # Handle the case where the order hasn't been saved properly
  redirect_to cart_path, alert: 'Failed to create the order.'
end

  rescue ActiveRecord::RecordInvalid => e
    # Handle exceptions if order or order items fail to save
    redirect_to cart_path, alert: "Failed to create order: #{e.message}"
  end

  private

  # Ensure that the user has provided necessary address details
  def ensure_user_address_present
    unless current_user.address_complete?
      redirect_to edit_user_registration_path, alert: 'Please complete your address details before proceeding with checkout.'
    end
  end

  # Calculate the total cost of the items in the cart
  def calculate_total
    session[:cart].sum do |product_id, quantity|
      product = Product.find(product_id)
      product.price * quantity
    end
  end
end
