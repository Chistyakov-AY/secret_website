# frozen_string_literal: true

FactoryBot.define do
  factory :post do
    title { Faker::Hipster.word }
    body { Faker::Lorem.word }
    user_id { create(:user).id }
  end
end