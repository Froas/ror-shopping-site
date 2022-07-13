class OrderLineItemsController < ApplicationController

  def show
    if user_signed_in?
      @order_items = current_order.order_items
    elsif 
      staff_signed_in?
      @user = User.find(params[:id]) 
      @order_items = user_order(@user).order_items
    end
  end

  def new
  end

  def index
  end
end
