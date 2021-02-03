class User < ApplicationRecord
  has_many :items
  has_many :buy_records
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

         
         validates :email, uniqueness: { case_sensitive: true }, format: {with: /\A(?=.*?[a-z])(?=.*?\d)[a-z\d]{6,50}+\z/i }

end


