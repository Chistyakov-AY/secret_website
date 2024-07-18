FactoryBot.define do
  factory :comment do
    id { 1 }
    body { Faker::Hipster .sentence(word_count: 3) }
    post_id { 1 }
  end
end