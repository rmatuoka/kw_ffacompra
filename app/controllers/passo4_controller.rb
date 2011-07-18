  class Passo4Controller < ApplicationController
  skip_before_filter :verify_authenticity_token
  #before_filter :logado
  
  def index
    
  end
  
  def create
    logger.info "=> CREATE"
    return unless request.post?
    logger.info "==> RETURN"
      pagseguro_notification do |notification|
      logger.info "===> PAGSEGURO NOTIFICATION"
        if notification.valid?(:force)
        logger.info "====> NOTIFICATION VALID"
          order = Order.find(notification.order_id)
          if order.pagseguro_id.blank?
            $first = true
          else
            $first = false
          end
          order.payment_type = notification.payment_method
          order.status = notification.status
          order.pagseguro_id = notification.transaction_id
          order.save
          
          if order.status.to_s.include? 'completed' or order.status.to_s.include? 'approved'
            UserMailer.payment_made(order).deliver
          else
            if $first
              UserMailer.transaction_initiated(order).deliver
            end
          end
        else
          logger.info "====> NOTIFICATION NOT VALID"
        end
      end
        render :nothing => true
  end
end
