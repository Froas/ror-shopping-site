class ProductsController < ApplicationController
  before_action :authenticate_staff!, except: [:index, :show]


  def create
    @product = Product.new(products_params)
    if @product.save
      redirect_to @product
    else
      render 'new'
    end
  end

  def new 
    @product = Product.new 
  end


  def edit
    @product = Product.find(params[:id])
  end

  def update
    @product = Product.find(params[:id])
    if @product.update(products_params)
      flash[:success] = "Updated"
      redirect_to @product
    else 
      render "edit"
    end
  end 

  def destroy
    @product = Product.find(params[:id])
    @product.destroy
    flash[:success] = "Product deleted"
    redirect_to products_path
  end 
  
  def show
    @product = Product.find(params[:id])
    @order_item = current_order.order_items.new
  end

  def index 
    @products = Product.paginate(page: params[:page], per_page: 12)
  end

  def products_params
    params.require(:product).permit(:title, :description, :price, :image)
  end 

end
