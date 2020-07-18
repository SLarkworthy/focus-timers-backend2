class ActivityTimerSerializer
    include FastJsonapi::ObjectSerializer
    attributes :id, :activity, :work_time_hours, :work_time_minutes, :break_time_hours, :break_time_minutes, :sound, :user_id
end