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

end
