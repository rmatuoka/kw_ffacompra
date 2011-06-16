class UserMailer < ActionMailer::Base
  default :from => "FESTA DAS FLORES ATIBAIA<contato@festadasfloresdeatibaia.com.br>"
 #"VENDAS - FESTA DAS FLORES<vendas@festadasfloresdeatibaia.com.br>"
  
  def payment_made(order)
    @order = order
    @order_itens = @order.order_tickets
    mail(:to => order.user.email, :bcc => "VENDAS - FESTA DAS FLORES<silva_v_bruno@hotmail.com>", :subject => "Pagamento Efetuado")
  end
  
  #Envia email (instruções para recuperar a senha)
	def send_email_password_reset(user)
    @user = user
		mail(:to => user.email, :subject => "Instruções para trocar a senha")
	end
  
end
