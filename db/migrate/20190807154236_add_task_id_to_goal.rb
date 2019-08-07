class AddTaskIdToGoal < ActiveRecord::Migration[5.2]
  def change
    add_column :goals, :task_id, :integer
  end
end
