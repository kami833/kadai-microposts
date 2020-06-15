class Micropost < ApplicationRecord
  belongs_to :user
  
  has_many :reverses_of_favorite, class_name: 'Favorite', foreign_key: 'user_id', dependent: :destroy
  has_many :users, through: :reverses_of_favorite
  
  validates :content, presence: true, length: { maximum: 255 }
end