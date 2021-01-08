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
    validates :price,           numericality:{ only_integer: true, greater_than: 300, less_than: 10000000 }
    validates :category_id,     numericality:{ other_than: 1 }
    validates :status_id,       numericality:{ other_than: 1 }
    validates :charge_id,       numericality:{ other_than: 1 }
    validates :prefecture_id,   numericality:{ other_than: 1 }
    validates :ship_date_id,    numericality:{ other_than: 1 }
  end


end