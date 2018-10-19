class AddFollowidFriends < ActiveRecord::Migration[5.2]
  def change
    add_column :friends, :follower_id, :integer
    add_column :friends, :following_id, :integer
  end
end
