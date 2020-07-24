class Api::V1::ActivityTimersController < ApplicationController

    before_action :require_login, only: [:create, :index, :show, :update, :destroy]
    helper_method :authorized_to_edit

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
        if authorized_to_edit(activity_timer)
            if activity_timer.update(activity_timer_params)
                render json: ActivityTimerSerializer.new(activity_timer)
            else
                render json: {errors: activity_timer.errors.full_messages}, status: :unprocessable_entity
            end
        else
            render json: {errors: ["Not authorized to edit"]}, status: :unauthorized
        end
    end

    def destroy
        activity_timer = ActivityTimer.find_by(id: params[:id])
        if authorized_to_edit(activity_timer)
            activity_timer.destroy
        else
            render json: {errors: ["Not authorized to edit"]}, status: :unauthorized
        end
    end

    private

    def activity_timer_params
        params.require(:activity_timer).permit(:activity, :work_time_hours, :work_time_minutes, :break_time_hours, :break_time_minutes, :sound, :user_id)
    end

    def authorized_to_edit(activity_timer)
        current_user == activity_timer.user 
    end

end
