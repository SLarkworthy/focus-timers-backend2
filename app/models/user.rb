class User < ApplicationRecord
    has_many :activity_timers
    has_secure_password

    validates :name, presence: true, uniqueness: true
    validates :email, presence: true, uniqueness: true

end
