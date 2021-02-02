class CreateAddresses < ActiveRecord::Migration[6.0]
  def change
    create_table :addresses do |t|
      t.references  :buy_record     ,null: false,foreign_key: true
      t.string      :post_cord      ,null: false
      t.string      :municipality   ,null: false
      t.string      :address_number ,null: false
      t.string      :building       ,null: false
      t.string      :phone_number   ,null: false
      t.integer     :prefecture_id  ,null: false
      t.timestamps
    end
  end
end
