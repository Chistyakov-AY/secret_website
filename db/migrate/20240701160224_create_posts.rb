# frozen_string_literal: true

# Comments
class CreatePosts < ActiveRecord::Migration[7.1]
  def change
    create_table :posts do |t|
      t.string :title, null: false
      t.string :body, null: false
      t.boolean :publication, default: false

      t.timestamps
    end
  end
end
