# frozen_string_literal: true
class Post < ApplicationRecord
  validates :title, presence: true
  validates :body, presence: true
  
  has_many :comments, dependent: :destroy
  belongs_to :user
  has_one_attached :image 
end