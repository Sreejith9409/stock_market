module UserStocks
  class PurchaseValidator < ActiveModel::Validator
    def validate(record)
      if record.transaction_type == 'purchase' && record.amount > record.user.wallet_amount
        record.errors.add(:amount, "greater than wallet amount. Please add money and try again")
      end
    end
  end
end
