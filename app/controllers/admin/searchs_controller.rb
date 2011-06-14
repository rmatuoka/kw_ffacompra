class Admin::SearchsController < ApplicationController
  
  def index
    
  end
  
  def results
    if !params[:keyword].blank?
      @Results = Order.search_for(params[:keyword])
      
      if !@Results.blank?
        @Results_itens = @Results.first.order_tickets
      end
    end
  end
  
end
