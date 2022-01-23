class CreateStockHistories < ActiveRecord::Migration[6.1]
  def change
    create_table :stock_histories do |t|
      t.decimal :amount
      t.integer :quantity_before_transaction
      t.integer :quantity_after_transaction
      t.string :transaction_type
      t.integer :user_stock_id
      t.integer :user_id

      t.timestamps
    end
  end
end
