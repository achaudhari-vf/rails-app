class ApplicationController < ActionController::Base
before_action :configure_permitted_parameters, if: :devise_controller?
    # helper_method :current_user, :logged_in?

    # def current_user
    #     @current_user ||= User.find(session[:user_id]) if session[:user_id]
    # end


    # def logged_in?
    #     !!current_user
    # end
    protected

    def configure_permitted_parameters
        devise_parameter_sanitizer.permit(:sign_up, keys: %i[name])
    end

end
