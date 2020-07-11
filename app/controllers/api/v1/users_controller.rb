class Api::V1::UsersController < ApplicationController

    def index
        users = User.all
        render json: UserSerializer.new(users)
    end

    def create
        user = User.new(user_params)
        if user.save
            session[:user_id] = user.id
            render json: {
                status: :created,
                user: UserSerializer.new(users)
            }
        else
            render json: {errors: user.errors.full_messages}, status: :unprocessable_entity
        end
    end

    def show
        user = User.find_by(id: params[:id])
        render json: UserSerializer.new(users)
    end

    private

    def user_params
        params.require(:user).permit(:name, :email, :password)
    end


end
