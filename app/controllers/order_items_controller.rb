class OrderItemsController < ApplicationController
  def create
    @order = current_order
    @order_item = @order.order_items.new(order_params)
    @order.save
    # render status: :ok, json: JSON.parse(CartItemsController.render(:destroy).first)
    # CartItem.find(params[:item_id]).destroy
    redirect_to carts_path
    # delete_item
    OrderMailer.order_confirmation(current_user, @order_item).deliver_now
    flash[:success] = "Order has been confirmed"
    session[:order_id] = @order.id
    session[:user_id] = current_user.id
    current_item = CartItem.find_by(id: params[:order_item][:cart_id,])
    order = Order::Create.new.call(current_item)
    # render json:  order
  end 

  # def delete_item
  #   cart_items_controller  = CartItemsController.new 
  #   cart_items_controller = request 
  #   cart_items_controller = response
  #   controller_you_want.params = { test: 1 }
  #   cart_items_controller.process(:test)
  #    render html: cart_items_controller.render_to_string(:home)
 
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
  def cart_params
    params.require(:order_item).permit(:item_id)
  end
end
