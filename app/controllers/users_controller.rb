class UsersController < ApplicationController
  layout "admin"
  
  def new
    @user = User.new
  end

  def create
    @user = User.new(params[:user])
    @user.role = "user"
    if @user.save
      #UserMailer.payment_made(@user).deliver
      redirect_to root_url, :notice => "Successfully created user."
    else
      flash[:error_cadastro] = "Todos os campos são obrigatórios!"
      redirect_to home_index_path
    end
  end

  def edit
    @user = current_user
  end

  def update
    @user = current_user
    if @user.update_attributes(params[:user])
      redirect_to root_url, :notice  => "Successfully updated user."
    else
      render :action => 'edit'
    end
  end
end
