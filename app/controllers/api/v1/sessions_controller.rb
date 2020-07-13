class Api::V1::SessionsController < ApplicationController

    def test
        render json: {hello: "test"}
    end
    def create
        user = User.find_by(email: params[:user][:email])
        if user && user.authenticate(params[:user][:password])
            session[:user_id] = user.id
            render json: {
                status: :created,
                logged_in: true,
                user: UserSerializer.new(user)
            }
        else
            render json: {error: "Invalid login"}, status: :unauthorized
        end
    end

    def logged_in
        if !!session[:user_id] && current_user
            render json: {
                logged_in: true,
                user: UserSerializer.new(current_user)
            }
        else
            render json: {
                logged_in: false
            }
        end
    end

    def delete
        session.delete(:user_id)
        render json: {
            status: 200
        }
    end

end
