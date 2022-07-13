class CartsController < ApplicationController
  before_action :user

  def user
    redirect_to(root_path) if current_user.nil?
  end

  def index
  end

  def show
    # byebug
    @cart_items = current_cart.cart_items
    @order_line_item = current_order.order_line_items.new
    @order_item = @order_line_item.order_items.new
  end

  def new
  end
end
