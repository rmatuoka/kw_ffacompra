class Admin::SearchsController < ApplicationController
  layout "admin"

  def index
    fstatus = ' '
    ftype = ' '
    if !params[:status].blank?
      if (ApplicationController.helpers.traduz_status_do_pedido(params[:status]) != '')
        fstatus = " and status = '"+ params[:status]+"'" 
      end
    end
    if !params[:type].blank?
      if (ApplicationController.helpers.traduz_tipo_do_pagamento(params[:type]) != '')
        ftype = " and payment_type = '"+ params[:type]+"'" 
      end
    end    
    
    @Orders = Order.find( :all,
                          :conditions => ['id > 0'+fstatus+ftype],
                          :order => 'id DESC',
                          :include =>[:user]
                        ).paginate :page => params[:page],:per_page => 50 
  end

  def show
    fstatus = ' '
    ftype = ' '
    if !params[:status].blank?
      if (ApplicationController.helpers.traduz_status_do_pedido(params[:status]) != '')
        fstatus = " and status = '"+ params[:status]+"'" 
      end
    end
    if !params[:type].blank?
      if (ApplicationController.helpers.traduz_tipo_do_pagamento(params[:type]) != '')
        ftype = " and payment_type = '"+ params[:type]+"'" 
      end
    end    
    
    @Orders = Order.find( :all,
                          :conditions => ['user_id = ?'+fstatus+ftype, params[:id]],
                          :order => 'id DESC',
                          :include =>[:user]
                        ).paginate :page => params[:page],:per_page => 50    
  end
    
  def results
    if !params[:keyword].blank?
      if params[:keyword].length < 10
        puts ">>>>>>ID"
        @Results = Order.find(:all, :conditions => ['id = ?', params[:keyword]])
      else
        puts ">>>>>>PAGSEGURO ID"
        @Results = Order.find(:all, :conditions => ['pagseguro_id = ?', params[:keyword]])
      end
      
      #@Results = Order.search_for(params[:keyword])
      
      if !@Results.blank?
        @Results_itens = @Results.first.order_tickets
      end
    end
  end
  
  def baixa
    @Baixa = OrderTicket.find(params[:id])
    @Baixa.baixa = true
    @Baixa.save
    redirect_to request.env['HTTP_REFERER']
  end
  
  def resend
    if !params[:cod].blank?
      $Order = Order.all(:conditions=>['id = ? and ((status = "completed") or (status = "approved"))',params[:cod]])
      if $Order.count == 0
        flash[:notice] = "Dados informados são invalidos"
      else
        UserMailer.payment_made($Order.first).deliver
        flash[:notice] = "Email Enviado com sucesso!"
      end
    else
      flash[:notice] = "Erro ao processar os dados, ID não informada!"
    end
  end
end
