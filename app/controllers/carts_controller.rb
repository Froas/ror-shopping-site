class CartsController < ApplicationController
  before_action :user

  def user
    redirect_to(root_path) if current_user.nil?
  end

  def index
  end

  def show
    @cart_items = current_cart.cart_items
    @order_item = current_order.order_items.new
  end

  def new
  end
end
