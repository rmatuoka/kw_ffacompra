class AddItensToUser < ActiveRecord::Migration
  def self.up
    add_column :users, :nome, :string
    add_column :users, :cpf, :string
    add_column :users, :rg, :string
    add_column :users, :cidade, :string
    add_column :users, :estado, :string
    add_column :users, :receber_info, :boolean
  end

  def self.down
    remove_column :users, :receber_info
    remove_column :users, :estado
    remove_column :users, :cidade
    remove_column :users, :rg
    remove_column :users, :cpf
    remove_column :users, :nome
  end
end
