class Post < ApplicationRecord
  belongs_to :user
  has_one_attached :image
  validates :image, presence: true
  # blob: { content_type: ['image/png', 'image/jpg', 'image/jpeg'], size_range: 1..10.megabytes }, 
end
