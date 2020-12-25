class ItemsController < ApplicationController

  def index
    @items = Itmes.all
  end

  def new
    @item = Items.new
  end

  def create
    Item.create(item_params)
  end

  private
  def item_params
    params.require(:item).permit(:name, :image, :introduction)
  end
end