class ItemsController < ApplicationController
  before_action :move_to_signed_in, except: [:index]
  def index
    @items = Item.all
  end

  def new
    @items = Item.new
  end

  def create
    Item.create(item_params)
  end

  private
  def move_to_signed_in
    unless user_signed_in?
      redirect_to  '/users/sign_in'
    end
  end

  def item_params
    params.require(:item).permit(:name, :image, :introduction)
  end

  def message_params
    params.require(:image).permit(:content, :image).merge(item_id: current_item.id)
  end
end