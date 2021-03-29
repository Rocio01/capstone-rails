class CreateActivities < ActiveRecord::Migration[6.1]
  def change
    create_table :activities do |t|
      t.string :name
      t.integer :activity_time
      t.references :user, :null => true, foreign_key: true
      t.references :group, :null => true, foreign_key: true

      t.timestamps
    end
    add_index :activities, [:user_id, :created_at]
  end
end
