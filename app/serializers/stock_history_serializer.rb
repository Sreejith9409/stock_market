class StockHistorySerializer < AppSerializer
  attributes :id, :amount, :quantity_before_transaction, :quantity_after_transaction, :transaction_type
end
