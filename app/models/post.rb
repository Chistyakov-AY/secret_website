# frozen_string_literal: true

# Comments
class Post < ApplicationRecord
  validates :title, :body, presence: true

  has_many :comments, dependent: :delete_all
  belongs_to :user

  has_one_attached :image, dependent: :detach do |attachable|
    attachable.variant :small_image, resize_to_limit: [500, 500], format: :webp
  end

  def self.ransackable_attributes(_auth_object = nil)
    %w[body created_at id id_value publication title updated_at user_id]
  end
end
