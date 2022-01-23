class CreatePayments < ActiveRecord::Migration[6.1]
  def change
    create_table :payments do |t|
      t.decimal :amount
      t.string :transaction_id
      t.string :status
      t.integer :user_id

      t.timestamps
    end
  end
end
