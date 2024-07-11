FactoryBot.define do
  factory :user do
    id { 1 }
    name { "Alex" }
    email { "user@mail.ru" }
    password { "111111" }
  end
end