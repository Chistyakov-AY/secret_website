# frozen_string_literal: true

# Comments
class Comment < ApplicationRecord
  belongs_to :post
  validates :body, presence: true
end
