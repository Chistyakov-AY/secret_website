# frozen_string_literal: true

FactoryBot.define do
  factory :user do
    name { Faker::Name.name }
    email { Faker::Internet.email }
    password { '111111'} 
    password_confirmation { '111111' }
    confirmed_at { Date.today }
  end
end