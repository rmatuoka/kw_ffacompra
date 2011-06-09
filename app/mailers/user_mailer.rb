class UserMailer < ActionMailer::Base
  default :from => "FESTA DAS FLORES ATIBAIA<contato@festadasfloresdeatibaia.com.br>"
  default :bcc => "VENDAS - FESTA DAS FLORES<vendas@festadasfloresdeatibaia.com.br>"
  
  def payment_made(order)
    @order = order
    @order_itens = @order.order_tickets
    mail(:to => order.user.email, :subject => "Pagamento Efetuado")
  end
end
