# frozen_string_literal: true
class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
#   devise :database_authenticatable, 
#          :recoverable, :rememberable, :validatable
#   # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, 
         :recoverable, 
         :rememberable, 
         :validatable,
         :confirmable
  
  has_many :posts, dependent: :destroy

  def self.ransackable_attributes(auth_object = nil)
    ["confirmation_sent_at", "confirmation_token", "confirmed_at", "created_at", "email", "encrypted_password", "id", "id_value", "name", 
    "remember_created_at", "reset_password_sent_at", "reset_password_token", "unconfirmed_email", "updated_at"]
  end
  
  def self.ransackable_associations(auth_object = nil)
    ["posts"]
  end
end
