class CreateActivityTimers < ActiveRecord::Migration[6.0]
  def change
    create_table :activity_timers do |t|
      t.string :activity
      t.string :work_time
      t.string :break_time
      t.string :sound
      t.integer :user_id

      t.timestamps
    end
  end
end
