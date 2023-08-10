class Post < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :sex

  with_options presence: true do
    validates :title
    validates :disease
    validates :name
    validates :age,             numericality: { only_integer: true, greater_than_or_equal_to: 0, less_than_or_equal_to: 100, allow_blank: true }
  end
    validates :sex_id,          numericality: { other_than: 1, message: "を入力してください" }
  
  with_options presence: true do
    validates :family
    validates :airway
    validates :breathing
    validates :circulation
    validates :dysfunction_cns
    validates :symptom
    validates :allergy
    validates :medicine
    validates :past_history
    validates :last_meal
    validates :event
    validates :risk_factor
    validates :story
    validates :point
  end
  
  belongs_to :user
  has_one_attached :image
  has_many :comments
end
