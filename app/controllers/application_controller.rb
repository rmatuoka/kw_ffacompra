class ApplicationController < ActionController::Base
  protect_from_forgery
  
    #Authlogic
    helper_method :current_user
    rescue_from 'Acl9::AccessDenied', :with => :access_denied

    private

    def current_user_session
    return @current_user_session if defined?(@current_user_session)
    @current_user_session = UserSession.find
    end

    def current_user
    return @current_user if defined?(@current_user)
    @current_user = current_user_session && current_user_session.record
    end
    
    def logado
      if !current_user
        flash[:error] = "Para continuar, faça o login!"
        redirect_to root_url
      end
    end
    
    def access_denied
      redirect_to login_path
    end
end
