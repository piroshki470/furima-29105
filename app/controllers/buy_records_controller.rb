class BuyRecordsController < ApplicationController


  def index
    @buy_record = BuyRecord.new
  end


  def create
    @buy_record = BuyRecord.new(buy_record_params)
    if @buy_record.valid?
       @buy_record.save
      return redirect_to root_path
    else
      render 'index'
    end
  end

  private
  def buy_record_params
    params.require(:buy_record).permit(:price)
  end

end
