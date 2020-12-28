class ItemsController < ApplicationController

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
  def item_params
    params.require(:item).permit(:name, :image, :introduction)
  end

  def message_params
    params.require(:image).permit(:content, :image).merge(item_id: current_item.id)
  end
end