class Item < ApplicationRecord
  with_options　presence: true do
    validates :name
    validates :introduction
    validates :price
    validates :category_id
    validates :status_id
    validates :charge_id
    validates :prefecture_id
    validates :ship_date_id
end