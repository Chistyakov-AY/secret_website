FactoryBot.define do
  factory :post do
    id { 1 }
    title { "Post title for test title" }
    body { "Post body for test title" }
    user_id { 1 }
  end
end