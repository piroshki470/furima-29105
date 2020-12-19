class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

    VALID_PASSWORD_REGEX =/\A(?=.*?[a-z])(?=.*?\d)[a-z\d]{6,50}+\z/i
    validates :password, presence: true, length: { minimum: 6 } ,format: { with: VALID_PASSWORD_REGEX }

    VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
    validates :email, presence: true ,uniqueness: { case_sensitive: true }, format: { with: VALID_EMAIL_REGEX }

    validates :nickname,:birth_day,:password_confirmation,    presence: true
    validates :family_name,                                   presence: true, format: {with: /\A[ぁ-んァ-ン一-龥]/ } 
    validates :first_name,                                    presence: true, format: {with: /\A[ぁ-んァ-ン一-龥]/ } 
    validates :family_name_kana,                              presence: true, format: {with: /\A[ァ-ヶー－]+\z/ } 
    validates :first_name_kana,                               presence: true, format: {with: /\A[ァ-ヶー－]+\z/ } 

end


