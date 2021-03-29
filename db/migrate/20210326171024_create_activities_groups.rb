class CreateActivitiesGroups < ActiveRecord::Migration[6.1]
  def change
    create_table :activities_groups, id: false do |t|
        t.integer :activity_id
        t.integer :group_id

      t.timestamps
    end
    add_index :activities_groups, :activity_id
    add_index :activities_groups, :group_id
  end
end
