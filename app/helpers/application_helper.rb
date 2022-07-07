module ApplicationHelper
  


  def current_order
    if !session[:order_id].nil?
      Order.find(session[:order_id])
    else
      Order.new
    end
  end

  def current_cart
    if session[:cart_id].present?
      Cart.find(session[:cart_id])
    else
      current_user.cart || current_user.build_cart
    end
  end
end
