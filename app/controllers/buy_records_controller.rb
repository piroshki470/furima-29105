class BuyRecordsController < ApplicationController


  def index
    @item_buy_record = ItemBuyRecord.new
  end


  def create
    @item_buy_record = ItemBuyRecord.new(buy_record_params)
    if @item_buy_record.valid?
       @item_buy_record.save
       redirect_to action: :index
    else
      render action: :new
    end
  end

  private
  def buy_record_params
    params.require(:item_buy_record).permit(:password,:email,:nickname,:password_confirmation,:birth_day,:family_name,:first_name,:image,:name,:introduction,:price,:category_id,:status_id,:charge_id,:prefecture_id,:ship_date_id,:post_cord,:prefecture_id,:municipality,:address_number,:building,:phone_number)
  end

end
