FactoryBot.define do
  factory :post do
    id { 1 }
    title { Faker::Hipster.sentence(word_count: 3) }
    body { Faker::Lorem.sentence(word_count: 5) }
    user_id { 1 }
  end
end