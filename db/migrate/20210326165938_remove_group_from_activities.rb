class RemoveGroupFromActivities < ActiveRecord::Migration[6.1]
  def change
    remove_reference :activities, :group, null: false, foreign_key: true
  end
end
