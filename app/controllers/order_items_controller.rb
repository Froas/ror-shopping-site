class OrderItemsController < ApplicationController
  def create
    @order_line_item = current_order.order_line_items
    @order_item = @order_line_item.order_items.new(order_params)
    @order_line_item.save
    # CartItem.find(params[:item_id]).destroy
    redirect_to my_orders_path
    OrderMailer.order_confirmation(current_user, @order_item).deliver_now
    flash[:success] = "Order has been confirmed"
    # session[:order_id] = @order.id
    # session[:user_id] = current_user.id
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
