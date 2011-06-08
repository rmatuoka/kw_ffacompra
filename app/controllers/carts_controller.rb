class CartsController < ApplicationController
  def new
  end

  def edit
  end
  
  def create
    @cart = current_user.carts.build(params[:cart])
    if params[:cart][:amount].to_i > 0
      if !@cart.save 
        @erro = true
      end
    else
      @erro = true
    end
  end

  def destroy
    @cart = Cart.find(params[:id])
    @cart.destroy
    redirect_to passo2_index_path, :notice => "Successfully destroyed ticket."
  end

end
