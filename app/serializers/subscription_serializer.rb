class SubscriptionSerializer < AppSerializer
  attributes :id, :stock, :value, :subscribed_on

  def value
    object.stock.current_price
  end

  def stock
    object.stock.name
  end

  def subscribed_on
    object.created_at
  end
end
