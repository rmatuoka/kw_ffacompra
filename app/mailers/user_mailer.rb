class UserMailer < ActionMailer::Base
  default :from => "FESTA DAS FLORES ATIBAIA<contato@festadasfloresdeatibaia.com.br>"
  
  def payment_made(user)
    mail(:to => user.email, :subject => "Pagamento Efetuado")
  end
end
