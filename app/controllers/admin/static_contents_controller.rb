class Admin::StaticContentsController < ApplicationController  
  layout "admin"  
  access_control do
      allow :admin, :to => [:index]
    end
    
  def index
    
  end
end
