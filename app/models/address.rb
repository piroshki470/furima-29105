class Address < ApplicationRecord
  belongs_to :buy_record
  belongs_to_active_hash :prefecture
end
