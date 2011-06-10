class Passo2Controller < ApplicationController
  before_filter :logado
  
  def index
    @cart = current_user.carts.all
	
	if @cart.empty?
		flash[:alert] = true;
		redirect_to passo1_index_path
    end
	
    @total_final = 0
  end
end
