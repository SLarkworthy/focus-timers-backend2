class Api::V1::UsersController < ApplicationController

    def create
        user = User.new(user_params)
        if user.save
            session[:user_id] = user.id
            render json: {
                status: :created,
                user: UserSerializer.new(user)
            }
        else
            render json: {errors: user.errors.full_messages}, status: :unprocessable_entity
        end
    end

    def show
        user = User.find_by(id: params[:id])
        if user && current_user && user.id == current_user.id
            render json: UserSerializer.new(user)
        else
            render json: {errors: ["Not authorized to view"]}, status: :unauthorized
        end
    end

    private

    def user_params
        params.require(:user).permit(:name, :email, :password)
    end


end
