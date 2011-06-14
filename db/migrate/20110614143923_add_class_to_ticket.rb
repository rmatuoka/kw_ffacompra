class AddClassToTicket < ActiveRecord::Migration
  def self.up
    add_column :tickets, :classe, :string
  end

  def self.down
    remove_column :tickets, :classe
  end
end
