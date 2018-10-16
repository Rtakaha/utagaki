class CreateGroups < ActiveRecord::Migration[5.2]
  def change
    create_table :groups do |t|
      t.string :name
      t.string :theme
      t.integer :group_id

      t.timestamps
    end
  end
end
