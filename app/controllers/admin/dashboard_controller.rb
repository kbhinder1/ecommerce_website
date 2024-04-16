class Admin::DashboardController < ApplicationController
 def index
  @products = Product.all
end
end
