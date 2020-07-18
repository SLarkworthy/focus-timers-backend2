class ActivityTimer < ApplicationRecord
    belongs_to :user

    validates :activity, presence: true
    validates :sound, inclusion: { in: %w(ring)}
    validates :work_time_minutes, numericality: { only_integer: true, less_than: 60 }
    validates :break_time_minutes, numericality: { only_integer: true, less_than: 60 }
 
end
