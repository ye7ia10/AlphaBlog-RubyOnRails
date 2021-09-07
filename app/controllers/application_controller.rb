class ApplicationController < ActionController::Base

    helper_method :current_user, :logged_in?

    def current_user
        @current_user ||= User.find_by(id: session[:user_id]) if session[:user_id] #instead of check multiple time it checks only one time
    end

    def logged_in?
        !! current_user  #this converts the answer to boolean
    end

    def require_user
        if !logged_in?
            flash[:alert] = "You Must Log In"
            redirect_to login_path
        end
    end



end
