class Passo1Controller < ApplicationController
  before_filter :logado
  
  def index
    @categories = Category.all(:include => :tickets)
    carts = current_user.carts.all
    @carts_hash = Hash.new
    i = 1
    carts.each do |c|
      @carts_hash[i]= c.ticket_id
      i = i+1
    end
    @cart = current_user.carts.build
	
  end
  
  def erro
    
  end
end
