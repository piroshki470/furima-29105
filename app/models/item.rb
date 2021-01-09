class Item < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to_active_hash :category
  belongs_to_active_hash :status
  belongs_to_active_hash :charge
  belongs_to_active_hash :prefecture
  belongs_to_active_hash :ship_date
  has_one_attached       :image
  belongs_to             :user
  has_one                :buy_record

  VALID_PRICE_REGEX =  /^[0-9]+$/

  with_options presence: true do
    validates :image
    validates :name
    validates :introduction
    validates :price,           numericality:{ only_integer: true, greater_than: 299, less_than: 10000000 }
     with_options numericality:{ other_than: 1 } do
      validates :category_id     
      validates :status_id       
      validates :charge_id      
      validates :prefecture_id
      validates :ship_date_id
    end
  end


end