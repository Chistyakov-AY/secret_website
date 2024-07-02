class AddIndexToPosts < ActiveRecord::Migration[7.1]
  def change
    add_column :posts, :user_id, :integer
    add_index :posts, :user_id
  end
end
