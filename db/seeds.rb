# frozen_string_literal: true

Post.destroy_all
User.destroy_all

user1 = User.create!(name: 'User1', email: '1111@mail.ru', password: '111111')
user1.confirm
user2 = User.create!(name: 'User2', email: 'dolomit.odn@mail.ru', password: '111111')
user2.confirm

15.times do
  title = Faker::Hipster.sentence(word_count: 3)
  body = Faker::Lorem.paragraph(sentence_count: 5, supplemental: true, random_sentences_to_add: 4)
  Post.create title:, body:, user_id: user1.id
end

if AdminUser.all.empty?
  AdminUser.create!(email: 'chistyakov_ay@mail.ru', password: '111111',
                    password_confirmation: '111111')
end
