
Post.destroy_all
User.destroy_all
# Comment.destroy_all

# if User.all.empty?
  user1 = User.create!(name: "User1", email: "1111@mail.ru", password: "111111")
  user2 = User.create!(name: "User2", email: "dolomit.odn@mail.ru", password: "111111")
  user1.confirm
  user2.confirm
# end

15.times do
  title = Faker::Hipster.sentence(word_count: 3)
  body = Faker::Lorem.paragraph(sentence_count: 5, supplemental: true, random_sentences_to_add: 4)
  Post.create title: title, body: body, user_id: User.first.id
end

AdminUser.create!(email: "chistyakov_ay@mail.ru", password: "111111", password_confirmation: "111111") if AdminUser.all.empty?

# p1 = Post.create(title: "1 post", body: "Info", user_id: 1)
# p2 = Post.create(title: "2 post", body: "Information for the second post", user_id: 1)
# p3 = Post.create(title: "3 post", body: "Information for the third post", user_id: 1)
# p4 = Post.create(title: "4 post", body: "Information for the fourth post", user_id: 1)

# c = Comment.create(body: "Комментарий", post_id: Post.first)
# c = Comment.create(body: "Комментарий №2", post_id: Post.first)AdminUser.create!(email: 'admin@example.com', password: 'password', password_confirmation: 'password') if Rails.env.development?