class Passo3Controller < ApplicationController
  before_filter :logado
  
  def index
    @carts = current_user.carts.all
    
    @total_final = 0
    
    @order = Order.new
    #GRAVAR TRANSACAO NO BANCO , OS ITENS COMPRADOS ESTAO GRAVADOS NO CARRINHO
    #VERIFICA SE EXISTE A TRANSACAO
    @order.user_id = current_user.id
    @order.status = "incompleted"
    
    if !@order.save
      #erro
      flash[:notice] = "Erro ao gravar transação"
    else
      #GERAR PEDIDO
      @order_product = PagSeguro::Order.new(@order.id)
      
      #PEGA ITENS DO CARRINHO E ADICIONA AO PEDIDO E FINALIZA
      @cart = current_user.carts.all
      
      if !@cart.blank?
        @cart.each do |cart_item|
          @pedidos = @order.order_tickets.build
          @pedidos.ticket_id = cart_item.ticket_id
          @pedidos.amount = cart_item.amount
          @pedidos.price = cart_item.price
          @pedidos.save
          @order_product.add :id => cart_item.ticket_id, :price => cart_item.price, :description => cart_item.ticket.name
          #cart_item.destroy
        end
      end
    end
  
    #LIMPA CARRINHO
  end
end
