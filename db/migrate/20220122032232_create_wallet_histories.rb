class CreateWalletHistories < ActiveRecord::Migration[6.1]
  def change
    create_table :wallet_histories do |t|
      t.decimal :amount
      t.decimal :wallet_before_transaction
      t.decimal :wallet_after_transaction
      t.string :transaction_type
      t.string :status
      t.string :payment_type
      t.text :log
      t.integer :payment_id
      t.integer :user_id
      t.timestamps
    end
  end
end
