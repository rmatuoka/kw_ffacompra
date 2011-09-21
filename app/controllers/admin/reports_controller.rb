class Admin::ReportsController < ApplicationController
  layout "admin"
  def index 
    @reports = OrderTicket.find(  :all,
                            :select => "`order_tickets`.`ticket_id`, sum(`order_tickets`.`amount`) as qtde,sum(`order_tickets`.`amount` * `order_tickets`.`price`) as total",
                            :joins => "`order_tickets` INNER JOIN `orders` ON `orders`.`id` = `order_tickets`.`order_id`",
                            :conditions => ['`orders`.`status` = "completed" or `orders`.`status` = "verifying"'],
                            :group => '`order_tickets`.`ticket_id`'
                          )
  end

end
