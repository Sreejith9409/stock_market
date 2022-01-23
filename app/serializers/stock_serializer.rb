class StockSerializer < AppSerializer
  attributes :id, :name, :selling_price, :total_count, :current_price, :available_count
end
