class ActivityTimerSerializer
    include FastJsonapi::ObjectSerializer
    attributes :id, :activity, :work_time, :break_time, :sound, :user_id
end