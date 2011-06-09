class Admin::StaticContentsController < ApplicationController  
  access_control do
      allow :admin, :to => [:index]
  end
  
  layout "admin"  
    
  def index
    
  end
end
