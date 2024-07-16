class Post < ApplicationRecord
  # acts_as_votable
  
  validates :title, presence: true
  validates :body, presence: true

  has_many :comments, dependent: :destroy
  belongs_to :user

  has_one_attached :image do |attachable|
    attachable.variant :thumb, resize_to_limit: [1000, 1000]
  end
end