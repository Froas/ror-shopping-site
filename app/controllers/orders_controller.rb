class OrdersController < ApplicationController
  before_action :logged_in_user


  def logged_in_user 
    unless !current_user.nil? or !current_staff.nil?
      flash[:danger] = "Please Log in"
      redirect_to new_user_session_url
    end
  end

  def index
  end

  def show
    if user_signed_in?
      @order_items = current_order.order_items
    elsif 
      staff_signed_in?
      @user = User.find(params[:id]) 
      @order_items = user_order(@user).order_items
    end
  end

  def detail
    if user_signed_in?
      @user = current_user
    elsif
      @user = User.find(params[:user])
    end
      @item = OrderItem.find(params[:item])
  end

  def new
  end
  
end
