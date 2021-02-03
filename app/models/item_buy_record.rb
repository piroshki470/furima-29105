class ItemBuyRecord

  include ActiveModel::Model
  attr_accessor :password,:email,:nickname,:password_confirmation,:birth_day,:family_name,:first_name,:image,:name,:introduction,:price,:category_id,:status_id,:charge_id,:prefecture_id,:ship_date_id,:post_cord,:prefecture_id,:municipality,:address_number,:building,:phone_number

  

  with_options presence: true do
    #購入記録-送付先
    validates :post_cord,format: { with: /\A[0-9]{3}-[0-9]{4}\z/, message: "is invalid. Include hyphen(-)" }
    validates :municipality
    validates :address_number
    validates :building
    validates :phone_number
    validates :prefecture_id,numericality:{ other_than: 1 }
    #商品登録
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
    #user登録
    validates :password, length: { minimum: 6 } ,format: {with: /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i}

    validates :nickname
    validates :password_confirmation
    validates :birth_day
    with_options format: {with: /\A[ぁ-んァ-ン一-龥]/ } do
      validates :family_name
      validates :first_name
    end
    with_options format: {with: /\A[ァ-ヶー－]+\z/ } do
      validates :family_name_kana
      validates :first_name_kana
    end
  end

  def save
    @user = User.create(password: password,email: email,nickname: nickname,password_confirmation: password_confirmation,birth_day: birth_day,family_name: family_name,first_name: first_name)
    @item = Item.create(image: image,name: name,introduction: introduction,price: price,category_id: category.id,status_id: status.id,charge_id: charge.id,prefecture_id: prefecture.id,ship_date_id: ship_date.id)
    Address.create(post_cord: post_cord,municipality: municipality,address_number: address_number,building: building,phone_number: phone_number,prefecture_id: prefecture.id)
    BuyRecord.create(user_id: user.id,item_id: item.id)
  end
end
