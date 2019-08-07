class CreateTasks < ActiveRecord::Migration[5.2]
  def change
    create_table :tasks do |t|
      t.string :title
      t.date :date
      t.time :start_time
      t.time :end_time
      t.boolean :recurring
      t.integer :user_id

      t.timestamps
    end
  end
end
