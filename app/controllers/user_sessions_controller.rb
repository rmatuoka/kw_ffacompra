class UserSessionsController < ApplicationController
  layout "admin"
  
  def new
    @user_session = UserSession.new
  end

  def create
    @user_session = UserSession.new(params[:user_session])
    if @user_session.save
      if (User.find(@user_session.user).has_role? :admin)
        redirect_to admin_root_path
      else
        redirect_to passo1_index_path, :notice => "Successfully created user session."
      end
    else
      #render :action => 'new'
      flash[:error] = "Usuário e/ou senha inválidos!"
      redirect_to root_url
    end
  end

  def destroy
    @user_session = UserSession.find
    @user_session.destroy
    redirect_to root_url, :notice => "Successfully destroyed user session."
  end
end
