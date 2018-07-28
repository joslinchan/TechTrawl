class ApplicationController < ActionController::Base

    private
    def current_user
        if session[:user_id].present?
            @current_user ||= User.find_by(id: session[:user_id])
        end
    end

    helper_method(:current_user)

    def authenticate_user!
        unless current_user.present?
            flash[:danger] = "Please sign in or sign up first"
            redirect_to new_session_path
        end
    end
    

end
