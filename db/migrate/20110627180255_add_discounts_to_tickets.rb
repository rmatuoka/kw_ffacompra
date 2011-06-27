class AddDiscountsToTickets < ActiveRecord::Migration
  def self.up
    add_column :tickets, :above, :integer, :default => '0'
    add_column :tickets, :discount, :decimal, :default => '0'
  end

  def self.down
    remove_column :tickets, :discount
    remove_column :tickets, :above
  end
end
