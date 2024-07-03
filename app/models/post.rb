class Post < ApplicationRecord
  # acts_as_votable
  
  validates :title, presence: true
  validates :body, presence: true

  has_many :comments, dependent: :destroy
  belongs_to :user
  has_many_attached :images

end
