class CreateStocks < ActiveRecord::Migration[6.1]
  def change
    create_table :stocks do |t|
      t.string :name
      t.decimal :selling_price
      t.integer :total_count
      t.decimal :current_price
      t.integer :available_count

      t.timestamps
    end
  end
end
