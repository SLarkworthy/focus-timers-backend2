class ApplicationController < ActionController::Base

    skip_before_action :verify_authenticity_token 

    helper_method :current_user, :logged_in?

    private

    def current_user 
        @current_user ||= User.find(session[:user_id]) if session[:user_id]
    end

    def logged_in?
        !!current_user
    end

    def require_login
        return head(:forbidden) unless logged_in?
    end

end
