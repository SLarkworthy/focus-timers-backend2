class Api::V1::ActivityTimersController < ApplicationController

    def index
        activity_timers = ActivityTimer.all
        render json: activity_timers
    end

    def create
        activity_timer = ActivityTimer.new(activity_timer_params)
        if activity_timer.save
            render json: activity_timer
        else
            render json: {errors: activity_timer.errors.full_messages}, status: :unprocessable_entity
        end
    end

    def show
        activity_timer = ActivityTimer.find_by(id: params[:id])
        render json: activity_timer
    end

    def destory
        activity_timer = ActivityTimer.find_by(id: params[:id])
        activity_timer.destroy
    end

    private

    def activity_timer_params
        params.require(:activity_timer).permit(:activity, :work_time, :break_time, :sound, :user_id)
    end

end
