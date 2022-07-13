class OrderItemsController < ApplicationController
  def create
    @order = current_order
    @order_line_item = @order.order_line_items.new
    @order_item = @order_line_item.order_items.new(order_params)
    @order_line_item.save
    @order.save
    redirect_to my_orders_path
    OrderMailer.order_confirmation(current_user, @order_item).deliver_now
    flash[:success] = "Order has been confirmed"
    session[:order_id] = @order.id
    session[:user_id] = current_user.id
  end 

  def buy_all
    @cart_items = current_cart.cart_items
    @order = current_order
    @order_line_item = @order.order_line_items.new
    redirect_to my_orders_path
    @cart_items.each do |item|
      @order_item = @order_line_item.order_items.new(product_id: item.product_id)
      @order_line_item.save
      @order.save
       flash[:success] = "Order has been confirmed"
      session[:order_id] = @order.id
      session[:user_id] = current_user.id
    end
    
  end

  def show
    if user_signed_in?
      @order_items = current_order.order_line_items
      # @order_items = OrderItems.find_by(order_line_item_id: )
    elsif 
      staff_signed_in?
      @user = User.find(params[:id]) 
      @order_items = user_order(@user).order_items
    end
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
