class OrderItemsController < ApplicationController
  def create
    @order = current_order
    @order_item = @order.order_items.new(order_params)
    @order.save
    redirect_to my_orders_path
    # delete_item(order_params)
    OrderMailer.order_confirmation(current_user, @order_item).deliver_now
    flash[:success] = "Order has been confirmed"
    session[:order_id] = @order.id
    session[:user_id] = current_user.id
  end 

  # def delete_item(params)
  #   cart_items_controller  = CartItemsController.new 
  #   cart_items_controller = request 
  #   cart_items_controller = response
  #   cart_items_controller.params = { cart_id: params }
  #   cart_items_controller.process(:test)
  #   render html: cart_items_controller.render_to_string(:home)
  # end

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
