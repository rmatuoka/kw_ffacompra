class Order < ActiveRecord::Base
  belongs_to :user
  has_many :order_tickets
  
  scoped_search :on => [:id, :pagseguro_id]
end