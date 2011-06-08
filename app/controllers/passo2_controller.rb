class Passo2Controller < ApplicationController
  before_filter :logado
  
  def index
    @cart = current_user.carts.all
    
    @total_final = 0
  end
end
