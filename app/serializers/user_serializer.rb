class UserSerializer
    include FastJsonapi::ObjectSerializer
    attributes :id, :name, :email, :activity_timers
end