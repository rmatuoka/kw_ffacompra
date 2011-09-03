KwFfacompra::Application.routes.draw do
  namespace(:admin){ resources :news }

  get "passo1/index"
  
  resources :passo1 do
    collection do
      get 'erro'
    end
  end
  resources :passo2
  resources :passo3
  resources :passo4
  resources :user_sessions
  resources :users
  resources :home
  resources :carts
  resources(:order){
    resources :order_tickets
  }
  resources :password_resets
  
  #Inicio do namespace Admin
  namespace(:admin){
    resources :tickets
    resources :static_contents
    resources :users do
      collection do
        get 'search'
      end
    end
    
    resources :searchs do
      collection do
        get 'results'
        get 'resend'  
      end
    end
    
    root :to => "static_contents#index"
  }
  #Final do namespace Admin
  
  #match 'login' => 'user_sessions#new'
  match 'login' => 'home#index'
  match 'logout' => 'user_sessions#destroy'
  
  root :to =>"home#index"
end
