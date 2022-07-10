class CartItemsController < ApplicationController
  def create
    @cart = current_cart
    @cart_item = @cart.cart_items.new(cart_params)
    @cart.save
    redirect_back fallback_location: root_path
    flash[:success] = "Items added to your cart"
    session[:cart_id] = @cart.id 
    
  end 

  def destroy
    @cart = current_cart
    @cart_item = @cart.cart_items.find_by(params[:id]).destroy
    @cart_item.destroy
    redirect_to carts_path
  end

  private 
  
  def cart_params
    params.require(:cart_item).permit(:product_id)
  end
end
