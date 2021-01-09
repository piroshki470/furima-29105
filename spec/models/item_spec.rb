require 'rails_helper'


describe Item do

  describe '#create' do
    before do
      @item = FactoryBot.build(:item)
    end


    describe '新規商品出品' do
      context '新規商品出品がうまく行くとき' do
        it "全ての項目が存在すれば出品できる" do
          expect(@item).to be_valid
        end
      end

      context '新規商品出品がうまくいかないとき' do
        it "画像が１枚も存在しないとき" do
           @item.image = nil
           @item.valid?
           expect(@item.errors.full_messages).to include("Image can't be blank")
        end
        it "商品名が存在しないとき" do
          @item.name = ""
          @item.valid?
          expect(@item.errors.full_messages).to include("Name can't be blank")
        end
        it "商品説明が存在しないとき" do
          @item.introduction = ""
          @item.valid?
          expect(@item.errors.full_messages).to include("Introduction can't be blank")
        end
        it "カテゴリー情報が存在しないとき" do
          @item.category_id = ""
          @item.valid?
          expect(@item.errors.full_messages).to include("Category can't be blank")
        end
        it "カテゴリー情報が選択されていないとき" do
          @item.category_id = 1
          @item.valid?
          expect(@item.errors.full_messages).to include("Category must be other than 1")
        end
        it "商品の状態が存在しないとき" do
          @item.status_id = ""
          @item.valid?
          expect(@item.errors.full_messages).to include("Status can't be blank")
        end
        it "商品の状態が選択されていないとき" do
          @item.status_id = 1
          @item.valid?
          expect(@item.errors.full_messages).to include("Status must be other than 1")
        end
        it "配送料負担の情報が存在しないとき" do
          @item.charge_id = ""
          @item.valid?
          expect(@item.errors.full_messages).to include("Charge can't be blank")
        end
        it "配送料負担の情報が選択されていないとき" do
          @item.charge_id = 1
          @item.valid?
          expect(@item.errors.full_messages).to include("Charge must be other than 1")
        end
        it "発送元地域の情報が存在しないとき" do
          @item.prefecture_id = ""
          @item.valid?
          expect(@item.errors.full_messages).to include("Prefecture can't be blank")
        end
        it "発送元地域が選択されていないとき" do
          @item.prefecture_id = 1
          @item.valid?
          expect(@item.errors.full_messages).to include("Prefecture must be other than 1")
        end
        it "発送までの日数情報が存在しないとき" do
          @item.ship_date_id = ""
          @item.valid?
          expect(@item.errors.full_messages).to include("Ship date can't be blank")
        end
        it "発送までの日数情報が選択されていないとき" do
          @item.ship_date_id = 1
          @item.valid?
          expect(@item.errors.full_messages).to include("Ship date must be other than 1")
        end
        it "価格情報が存在しないとき" do
          @item.price = ""
          @item.valid?
          expect(@item.errors.full_messages).to include("Price can't be blank")
        end
        it "価格が300円未満のとき" do
          @item.price = 299
          @item.valid?
          expect(@item.errors.full_messages).to include("Price must be greater than 300")
        end
        it "価格が9999999円を越えてるとき" do
          @item.price = 10000000
          @item.valid?
          expect(@item.errors.full_messages).to include("Price must be less than 10000000")
        end
        it "販売価格が全角数字のとき" do
          @item.price = "５０００"
          @item.valid?
          expect(@item.errors.full_messages).to include("Price is not a number")
        end
      end
    end  
  end
end