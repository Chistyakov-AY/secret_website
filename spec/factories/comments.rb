# frozen_string_literal: true

FactoryBot.define do
  factory :comment do
    body { Faker::Lorem.word }
    post_id { create(:post).id }
  end
end
