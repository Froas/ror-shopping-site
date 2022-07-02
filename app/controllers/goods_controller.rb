class GoodsController < ApplicationController
  before_action :authenticate_staff!, except: [:index, :show]


  def create
    @good = Good.new(goods_params)
    if @good.save
      redirect_to @good
    else
      render 'new'
    end
  end

  def new 
    @good = Good.new 
  end


  def edit
    @good = Good.find(params[:id])
  end

  def update
    @good = Good.find(params[:id])
    if @good.update(goods_params)
      flash[:success] = "Updated"
      redirect_to @good
    else 
      render "edit"
    end
  end 

  def destroy
    @good = Good.find(params[:id])
    @good.destroy
    flash[:success] = "Good deleted"
    redirect_to goods_path
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
