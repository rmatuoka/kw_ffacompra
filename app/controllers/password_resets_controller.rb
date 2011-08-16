class PasswordResetsController < ApplicationController
  layout "application", :except => [:new, :create]
  def new
  
  end
  
	def create
		@user = User.find_by_email(params[:email])
		if @user && @user.deliver_password_reset_instructions!
			UserMailer.send_email_password_reset(@user).deliver
			flash[:error] = "Foi enviado por e-mail a instrução de como alterar a sua senha."
			redirect_to login_path
		else
			flash[:error] = "O e-mail digitado é invalido! Digite um e-mail válido."
			redirect_to login_path
		end
	end
	

	def edit
	  load_user_using_perishable_token
	  if !@user
			flash[:error] = "O link expirou! Tente novamente."
			redirect_to login_path
		end
	end

	def update
	  load_user_using_perishable_token
	  if !@user
	      flash[:error] = "Ocorreu um erro!Tente novamente!"
  			render :action => :edit
	  else
    		@user.password = params[:user][:password]
    		@user.password_confirmation = params[:user][:password_confirmation]
    		if @user.save
    			flash[:error] = "Senha alterada com sucesso!"
    			redirect_to login_path
    		else
    		  flash[:error] = "Senhas precisão ser iguais!"
    			render :action => :edit
    		end
    end
	end

	private
	def load_user_using_perishable_token
		@user = User.find_using_perishable_token(params[:id], 3.hours.to_i)
	end
	
  
end
