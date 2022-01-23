class AddWalletAmountColumnToUsers < ActiveRecord::Migration[6.1]
  def change
    add_column :users, :wallet_amount, :decimal, default: 0
  end
end
