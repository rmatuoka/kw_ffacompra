class Passo1Controller < ApplicationController
  before_filter :logado
  
  def index
    @categories = Category.all
    
    @cart = current_user.carts.build
  end
  
  def erro
    
  end
end
