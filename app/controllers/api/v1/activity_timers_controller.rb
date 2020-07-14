class Api::V1::ActivityTimersController < ApplicationController

    def index
        if params[:user_id] && user = User.find_by(id: params[:user_id])
            render json: ActivityTimerSerializer.new(user.activity_timers) 
        else
            activity_timers = ActivityTimer.all
            render json: ActivityTimerSerializer.new(activity_timers)
        end
    end

    def create
        activity_timer = current_user.activity_timers.build(activity_timer_params)
        if activity_timer.save
            render json: ActivityTimerSerializer.new(activity_timer)
        else
            render json: {errors: activity_timer.errors.full_messages}, status: :unprocessable_entity
        end
    end

    def show
        activity_timer = ActivityTimer.find_by(id: params[:id])
        render json: ActivityTimerSerializer.new(activity_timer)
    end

    def update
        activity_timer = ActivityTimer.find_by(id: params[:id])
            if activity_timer.update(activity_timer_params)
                render json: ActivityTimerSerializer.new(activity_timer)
            else
                render json: {errors: activity_timer.errors.full_messages}, status: :unprocessable_entity
            end
    end

    def destroy
        activity_timer = ActivityTimer.find_by(id: params[:id])
        activity_timer.destroy
    end

    private

    def activity_timer_params
        params.require(:activity_timer).permit(:activity, :work_time_hours, :work_time_minutes, break_time_hours, break_time_minutes, :sound, :user_id)
    end

end
