class ItemsController < ApplicationController
  before_action :move_to_signed_in, except: [:index]
  def index
    @item = Item.all
  end

  def new
    @item = Item.new
  end

  def create
    @item = Item.new(item_params)
    if @item.save
       redirect_to root_path
    else
    render :new
    end
  end

  private
  def move_to_signed_in
    unless user_signed_in?
      redirect_to  '/users/sign_in'
    end
  end

  def item_params
    params.require(:item).permit( :name, :image, :introduction, :price, :category_id, :status_id, :charge_id, :prefecture_id, :ship_date_id).merge(user_id: current_user.id)
  end

end