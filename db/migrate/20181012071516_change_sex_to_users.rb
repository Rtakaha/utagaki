class ChangeSexToUsers < ActiveRecord::Migration[5.2]
  def change
    remove_column :users, :sex, :DOMString
    add_column :users, :sex, :string
  end
end
