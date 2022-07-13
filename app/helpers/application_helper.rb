module ApplicationHelper
  
  def user_order(user)
    if Order.find_by(user_id: user[:id]).present?
      Order.find_by(user_id: user[:id])
    else 
      @curr_user = User.find_by(id: user[:id])
      @curr_user.order || @curr_user.build_order
    end
  end
  
  # def current_order_line(order_line)
  #   if OrderItem.find_by(order_line_id: order_line[:id]).present?
  #     OrderItem.find_by(order_line_id: order_line[:id])
  #   else 
  #     current_order.order_line_items || current_order.build_order_line_items
  #   end
  # end

    

  def current_order_line
    if session[:order_line_id].present?
        OrderLineItem.find(session[:order_line_id])
      else
        if !current_order.order_line_items
           current_order.build_order_line_items
        end
        current_order.order_line_items.first
      end
  end


  def current_order
    if session[:order_id].present?
      Order.find(session[:order_id])
    else
      current_user.order || current_user.build_order
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
