class Ticket < ActiveRecord::Base
  belongs_to :category
  belongs_to :ticket_type
  has_many :carts
  has_many :order_tickets
  
  def self.all_published  
    Ticket.all(:conditions => ['published = 1'])
  end
  
  def self.find_by_date(date)
    Ticket.all(:conditions => ['published = 1 AND ticket_date = ?', date])
  end
end
