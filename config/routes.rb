KwFfacompra::Application.routes.draw do
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
  
  #Inicio do namespace Admin
  namespace(:admin){
    resources :tickets
    resources :static_contents
    resources :users
    resources :searchs do
      collection do
        get 'results'
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
