class CreateOrders < ActiveRecord::Migration
  def self.up
    create_table :orders do |t|
      t.integer :user_id
      t.string :status
      t.string :payment_type
      t.string :pagseguro_id

      t.timestamps
    end
  end

  def self.down
    drop_table :orders
  end
end
