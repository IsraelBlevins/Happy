class ApplicationController < ActionController::Base    
    protect_from_forgery with: :exception
    include SessionsHelper
    helper_method :current_user, :logged_in? 

    def current_user
        @current_user ||= User.find_by(id: session[:user_id])
    end

    # Returns true if the user is logged in, false otherwise.
    def logged_in?
        !current_user.nil?
    end
end
