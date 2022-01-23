class UserStockSerializer < AppSerializer
  attributes :id, :stock_name, :quantity, :amount, :stock_history

  def stock_name
    object.stock.name
  end

  def stock_history
    ActiveModel::Serializer::CollectionSerializer.new(object.stock_histories, serializer: StockHistorySerializer)
  end
end
