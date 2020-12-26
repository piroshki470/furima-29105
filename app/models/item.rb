class Item < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :category


  with_options presence: true do
    validates :image
    validates :name
    validates :introduction
    validates :price
    validates :category_id, numericality:{ other_than: 1 }
    validates :status_id
    validates :charge_id
    validates :prefecture_id
    validates :ship_date_id
  end
end