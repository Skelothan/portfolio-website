class ApplicationController < ActionController::Base

    rescue_from CanCan::AccessDenied do |exception|
        flash[:error] = "You are not authorized to take that action."
        redirect_to projects_path
    end

    def current_user
        @current_user ||= User.find(session[:user_id]) if session[:user_id]
    end
    helper_method :current_user

    def logged_in?
        current_user
    end
    helper_method :logged_in?

end
