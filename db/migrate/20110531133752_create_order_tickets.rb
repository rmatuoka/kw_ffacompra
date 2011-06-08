class CreateOrderTickets < ActiveRecord::Migration
  def self.up
    create_table :order_tickets do |t|
      t.integer :order_id
      t.integer :ticket_id
      t.integer :amount
      t.decimal :price

      t.timestamps
    end
  end

  def self.down
    drop_table :order_tickets
  end
end
