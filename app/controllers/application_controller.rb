class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  
  protected

    def authorizeAdmin
      if session[:user_id]
        if session[:user_type] == 'admin'
          return true;
        else
          redirect_to home_url
        end
      else
        redirect_to login_url
      end
    end

    def authorizeManager
      if session[:user_id]
        if session[:user_type] == 'admin' || session[:user_type] == 'manager'
          return true;
        else
          redirect_to home_url
        end
      else
        redirect_to login_url
      end
    end

    def authorizeUser
      if session[:user_id]
          return true;
      else
        redirect_to login_url
      end
    end

end
