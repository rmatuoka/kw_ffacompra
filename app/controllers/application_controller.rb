class ApplicationController < ActionController::Base
  protect_from_forgery
  
    #Authlogic
    helper_method :current_user

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
    
    rescue_from 'Acl9::AccessDenied', :with => :access_denied

    def access_denied
      if current_user
        redirect_to root_path
      else
        flash[:notice] = 'Acesso negado. Você precisa estar logado.'
        redirect_to login_path
      end
    end
end
