class ItemsController < ApplicationController
  before_action :authenticate_user!, except: [:index,:show]
  before_action :set_item, only: [:show,:edit]

  def index
    @items = Item.all
  end

  def new
    @item = Item.new
  end

  def show
  end

  def create
    @item = Item.new(item_params)
    if @item.save
       redirect_to root_path
    else
    render :new
    end
  end

  # def destroy
  #    @item = Item.find(params[:id])
  #    @item.destroy
  #    redirect_to root_path
  # end

   def edit
   end

   def update
    @item = Item.find(params[:id])
    @item.update(item_params)
    redirect_to root_path
   end
   

  private

  def item_params
    params.require(:item).permit( :name, :image, :introduction, :price, :category_id, :status_id, :charge_id, :prefecture_id, :ship_date_id).merge(user_id: current_user.id)
  end

  def set_item
    @item = Item.find(params[:id])
  end
end