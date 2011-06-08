class Passo4Controller < ApplicationController
  skip_before_filter :verify_authenticity_token
  #before_filter :logado
  
  def index
    
  end
  
  def create
    return unless request.post?
      pagseguro_notification do |notification|
        if notification.valid?(:force)
          order = Order.find(notification.order_id)
          order.payment_type = notification.payment_method
          order.status = notification.status
          order.pagseguro_id = notification.transaction_id
          order.save
          
          if order.status.to_s.include? 'completed'
            UserMailer.payment_made(@user).deliver
          #enviar email de confirmação
          #  corpo = "
          #  <b>Nome:</b>#{transaction.nome}<br />
          #  <b>E-mail: </b>#{transaction.email}<br />
          #  "
          #  Email.deliver_agradecimento(transaction.email)
          #  Email.deliver_pedido(@user.email,corpo)
          end
        end
      end
        render :nothing => true
  end
end
