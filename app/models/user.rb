# frozen_string_literal: true

# Comments
class User < ApplicationRecord
  devise :database_authenticatable,
         :recoverable,
         :rememberable,
         :validatable,
         :confirmable

  has_many :posts, dependent: :destroy
  # acts_as_voter

  def self.ransackable_attributes(_auth_object = nil)
    %w[confirmation_sent_at confirmation_token confirmed_at created_at email encrypted_password id id_value name
       remember_created_at reset_password_sent_at reset_password_token unconfirmed_email updated_at]
  end

  def self.ransackable_associations(_auth_object = nil)
    ['posts']
  end
end
