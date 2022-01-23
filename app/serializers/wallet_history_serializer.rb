class WalletHistorySerializer < AppSerializer
  attributes :id, :amount, :wallet_before_transaction, :wallet_after_transaction, :transaction_type,
    :status, :payment_type, :payment_id, :user_id, :created_at, :updated_at

end
