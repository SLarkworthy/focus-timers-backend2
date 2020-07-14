class RemoveColumnsFromActivityTimers < ActiveRecord::Migration[6.0]
  def change
    remove_column :activity_timers, :work_time
    remove_column :activity_timers, :break_time
  end
end
