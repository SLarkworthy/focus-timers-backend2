class ActivityTimer < ApplicationRecord
    belongs_to :user

    validate :work_time_cannot_be_zero, :break_time_cannot_be_zero
    validates :activity, presence: true
    validates :sound, inclusion: { in: %w(ring)}
    validates :work_time_minutes, numericality: { only_integer: true, less_than: 60 }
    validates :break_time_minutes, numericality: { only_integer: true, less_than: 60 }
    validates :work_time_hours, numericality: { only_integer: true, less_than: 12 }
    validates :break_time_hours, numericality: { only_integer: true, less_than: 12 }

    def work_time_cannot_be_zero
        if work_time_minutes === 0 && work_time_hours === 0
            errors.add(:work_time_minutes, "work time cannot be 00:00")
        end
    end
    def break_time_cannot_be_zero
        if break_time_minutes === 0 && break_time_hours === 0
            errors.add(:break_time_minutes, "break time cannot be 00:00")
        end
    end
 
end
