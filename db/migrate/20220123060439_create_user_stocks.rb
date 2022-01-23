class CreateUserStocks < ActiveRecord::Migration[6.1]
  def change
    create_table :user_stocks do |t|
      t.integer :stock_id
      t.integer :user_id
      t.integer :quantity, default: 0
      t.decimal :amount, default: 0

      t.timestamps
    end
  end
end
