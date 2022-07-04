class OrdersController < ApplicationController
  def index
  end

  def show
  end

  def new
  end
  def create
    @order = Order.new(order_params)
    @current_order.line_items.each do |item|
      @order.line_items << item
      item.cart_id = nil
    end
    @order.save
    Order.destroy(session[:order_id])
    session[:order_id] = nil
    redirect_to root_path
  end
  
  private
    def order_params
      params.require(:order).permit(:name, :email, :address)
    end
end
