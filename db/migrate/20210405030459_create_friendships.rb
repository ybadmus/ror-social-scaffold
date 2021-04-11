class CreateFriendships < ActiveRecord::Migration[5.2]
  def change
    create_table :friendships do |t|
      t.integer :id, 
      t.references :user, index: true, foreign_key: true
      t.references :friend, index: true
      t.boolean :confirmed, default: false

      t.timestamps null: false
    end
    add_foreign_key :friendships, :users, column: :friend_id
    add_primary_key :friendships, :users, column: :friend_id

  end
end
