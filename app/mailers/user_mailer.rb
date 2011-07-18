class UserMailer < ActionMailer::Base
  default :from => "FESTA DAS FLORES ATIBAIA<contato@festadasfloresdeatibaia.com.br>"
 #default :from =>"VENDAS - FESTA DAS FLORES<vendas@festadasfloresdeatibaia.com.br>"
  
  def payment_made(order)
    @order = order
    @order_itens = @order.order_tickets
    #mail(:to => order.user.email, :subject => "Pagamento Efetuado")
    mail(:to => order.user.email, :bcc => "COMPRA ONLINE - FESTA DAS FLORES<compras@festadasfloresdeatibaia.com.br>", :subject => "Pagamento Efetuado")
  end
  
  #Envia email (instruções para recuperar a senha)
	def send_email_password_reset(user)
    @user = user
		mail(:to => user.email, :subject => "Instruções para trocar a senha")
	end
  
  def transaction_initiated(order)
    @order = order
    mail(:to => order.user.email, :subject => "Transação Iniciada")
  end
end
