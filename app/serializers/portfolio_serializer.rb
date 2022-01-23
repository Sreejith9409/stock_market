class PortfolioSerializer < AppSerializer
  attributes :id, :email, :username, :wallet_amount, :user_stocks, :wallet_history

  def user_stocks
    ActiveModel::Serializer::CollectionSerializer.new(object.user_stocks, serializer: UserStockSerializer)
  end

  def wallet_history
    ActiveModel::Serializer::CollectionSerializer.new(object.wallet_histories, serializer: WalletHistorySerializer)
  end
end
