class AddDiscountToTicketType < ActiveRecord::Migration
  def self.up
    add_column :ticket_types, :discount, :decimal
  end

  def self.down
    remove_column :ticket_types, :discount
  end
end
