class Post < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :title
  belongs_to :sex

    validates :title_id,        numericality: { other_than: 1, message: "を入力してください" }
  
  with_options presence: true do
    validates :disease
    validates :name
    validates :age,             numericality: { only_integer: true, greater_than_or_equal_to: 0, less_than_or_equal_to: 100, allow_blank: true }
  end
    validates :sex_id,          numericality: { other_than: 1, message: "を入力してください" }
  
 with_options unless: -> { title_id == 2 } do
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
      validates :images,          length: { minimum: 1, maximum: 5, message: "は1枚以上5枚以下にしてください", allow_blank: true  }
    end
  end 

  with_options if: -> { title_id == 2 } do
    validates :age, numericality: { only_integer: true, greater_than_or_equal_to: 0, less_than_or_equal_to: 100, allow_blank: true }
    validates :sex_id, numericality: { other_than: 1, message: "を入力してください" }
    validates :symptom, presence: true
  end
  
  belongs_to :user
  has_many_attached :images
  has_many :comments, dependent: :destroy
  has_many :likes

  def self.search(search)
    if search.present?
      Post.where("title_id = #{search}")
    else
      Post.all
    end
  end

  def liked_by?(user)
    likes.where(user_id: user.id).exists?
  end
end
