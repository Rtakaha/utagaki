class RenameFollowColumnToFriends < ActiveRecord::Migration[5.2]
  def change
    rename_column :friends, :follower_id, :followfrom_id
    rename_column :friends, :following_id, :followto_id
  end
end
