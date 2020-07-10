class User < ApplicationRecord
    has_many :activity_timers
    has_secure_password
end
