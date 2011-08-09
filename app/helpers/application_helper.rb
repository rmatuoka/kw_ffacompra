module ApplicationHelper
  def traduz_status_do_pedido(status)
    
    retorno = ""
    case status
      when "completed"
        retorno = "Completo"
      
       when "incompleted"
          retorno = "Incompleto"
    
      when "pending"
        retorno = "Aguardando Pagamento"
        
      when "approved"
        retorno = "Aprovado"
        
      when "verifying"
        retorno = "Em Análise"
        
      when "canceled"
        retorno = "Cancelado"
        
      when "refunded"
        retorno = "Devolvido"
    end
    
    return retorno
  end
  
  def traduz_tipo_do_pagamento(tipo)
    retorno = ""
    case tipo 
      when "credit_card"
        retorno = "Cartão de Crédito"
    
      when "invoice"
        retorno = "Boleto"
        
      when "pagseguro"
        retorno = "Transferência entre Pagseguro"
        
      when "online_transfer"
        retorno = "Pagamento Online"
        
      when "donation"
        retorno = "Doação"

    end
    
    return retorno
  end
end
