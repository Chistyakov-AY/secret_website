# frozen_string_literal: true
class Post < ApplicationRecord
  validates :title, presence: true
  validates :body, presence: true
  
  has_many :comments, dependent: :destroy
  belongs_to :user
  has_one_attached :image 

  def self.ransackable_attributes(auth_object = nil)
    ["body", "created_at", "id", "id_value", "publication", "title", "updated_at", "user_id"]
  end
end