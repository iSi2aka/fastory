class User < ApplicationRecord
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  
  validates :nickname,      presence: true
  validates :password,      format: { with:  /\A(?=.*?[a-z])(?=.*?[\d])[a-z\d]+\z/i, message: 'は半角英数を両方含む必要があります', allow_blank: true }
  validates :department,    presence: true

  has_many :posts
  has_many :comments
end
