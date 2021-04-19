class ApplicationController < ActionController::Base    
    protect_from_forgery with: :exception
    include SessionsHelper
    helper_method :current_user, :logged_in?, :week_range

    def current_user
        @current_user ||= User.find_by(id: session[:user_id])
    end

    # Returns true if the user is logged in, false otherwise.
    def logged_in?
        !current_user.nil?
    end

    def week_range(date: DateTime.now, start_day: :sunday)
        start_date = date.beginning_of_week(start_day)
        end_date = date.end_of_week(start_day)
        start_date_string = start_date.strftime("%B %d")
        week_end_string = (start_date.month == end_date.month) ? 
          end_date.strftime("%d") : end_date.strftime("%B %d")  
        "#{start_date_string} - #{week_end_string}, #{DateTime.now.year}"
      end

end
