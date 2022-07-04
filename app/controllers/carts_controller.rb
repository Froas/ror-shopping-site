class CartsController < ApplicationController

  def index
  end

  def show
    @cart_items = current_cart.cart_items
    @order_item = current_order.order_items.new
  end

  def new
  end
  def create
    @cart = Cart.new(cart_params)
    @current_cart.line_items.each do |item|
      @cart.line_items << item
      item.cart_id = nil
    end
    @cart.save
    Cart.destroy(session[:cart_id])
    session[:cart_id] = nil
    redirect_to root_path
  end
  
  private
    def cart_params
      params.require(:cart).permit(:name, :email, :address)
    end
  
end
