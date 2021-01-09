class User < ApplicationRecord
  has_many :items
  has_many :buy_records
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

    VALID_PASSWORD_REGEX =/\A(?=.*?[a-z])(?=.*?\d)[a-z\d]{6,50}+\z/i
    VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i

    with_options presence: true do
      validates :password, length: { minimum: 6 } ,format: { with: VALID_PASSWORD_REGEX }
      validates :email, uniqueness: { case_sensitive: true }, format: { with: VALID_EMAIL_REGEX }
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
end


