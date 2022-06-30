class GoodsController < ApplicationController

  def create
    @good = Good.new(goods_params)
    if @good.save
      redirect_to root_url
    else
      render 'new'
    end
  end

  def new 
    @good = Good.new 
  end


  def edit
  end

  def update
  end 

  def destroy
  end 
  
  def show
    @good = Good.find(params[:id])
  end

  def index 
    @goods = Good.paginate(page: params[:page], per_page: 10)
  end

  def goods_params
    params.require(:good).permit(:title, :description, :price, :image)
  end 

end
