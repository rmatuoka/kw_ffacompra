class AddBaixaToOrderTickets < ActiveRecord::Migration
  def self.up
    add_column :order_tickets, :baixa, :boolean, :default => false
  end

  def self.down
    remove_column :order_tickets, :baixa
  end
end
