class CreateCarts < ActiveRecord::Migration
  def self.up
    create_table :carts do |t|
      t.integer :user_id
      t.integer :ticket_id
      t.decimal :price
      t.integer :amount

      t.timestamps
    end
  end

  def self.down
    drop_table :carts
  end
end
