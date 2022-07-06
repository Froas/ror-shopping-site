class OrderItemsController < ApplicationController
  def create
    @order = current_order
    @order_item = @order.order_items.new(order_params)
    @order.save
    redirect_to my_orders_path
    # redirect_to delete_path_url(order_params)
    flash[:success] = "Order has been confirmed"
    session[:order_id] = @order.id 
  end 

  def destroy
    @order = current_order
    @order_item = @order.order_items.find(params[:id])
    @order_item.destroy
    @order_items = current_order.order_items
    redirect_to carts_path
  end

  private 
  
  def order_params
    params.require(:order_item).permit(:product_id)
  end
end
