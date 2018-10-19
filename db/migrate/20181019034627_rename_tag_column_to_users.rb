class RenameTagColumnToUsers < ActiveRecord::Migration[5.2]
  def change
    rename_column :users, :tag, :userid
  end
end
