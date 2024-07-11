FactoryBot.define do
  factory :comment do
    id { 1 }
    body { "Comment for test" }
    post_id { 1 }
  end
end