# This file should ensure the existence of records required to run the application in every environment (production,
# development, test). The code here should be idempotent so that it can be executed at any point in every environment.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Example:
#
#   ["Action", "Comedy", "Drama", "Horror"].each do |genre_name|
#     MovieGenre.find_or_create_by!(name: genre_name)
#   end

Post.destroy_all
Comment.destroy_all

p1 = Post.create(title: "1 post", body: "Info")
p2 = Post.create(title: "2 post", body: "Information for the second post")

c = Comment.create(body: "Комментарий", post_id: p1.id)
c = Comment.create(body: "Комментарий №2", post_id: p2.id)