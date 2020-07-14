class AddTimesToActivityTimers < ActiveRecord::Migration[6.0]
  def change
    add_column :activity_timers, :work_time_hours, :integer
    add_column :activity_timers, :work_time_minutes, :integer
    add_column :activity_timers, :break_time_hours, :integer
    add_column :activity_timers, :break_time_minutes, :integer
  end
end
