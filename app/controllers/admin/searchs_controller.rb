class Admin::SearchsController < ApplicationController
  layout "admin"
  
    
  def index
    @Orders = Order.all(:include =>[:user], :order => 'id DESC').paginate :page => params[:page],:per_page => 50
  end

  def show
    @Orders = Order.all(:include =>[:user], :order => 'id DESC', :conditions => ['user_id = ?', params[:id]]).paginate :page => params[:page],:per_page => 50
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
