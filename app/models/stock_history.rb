class StockHistory < ApplicationRecord
  belongs_to :user
  belongs_to :user_stock

  before_create :adjust_history_balance

  enum transaction_type: {
    purchase: "purchase", sold: "sold"
  }

  validates_with UserStocks::PurchaseValidator
  
  private

  def adjust_history_balance
    ActiveRecord::Base.transaction do
      if transaction_type == "purchase"
        txn_type = 'debit'
        log = "Purchase of stock #{id}"
      else
        txn_type = 'credit'
        log = "Sold stocks #{id}"
      end
      WalletHistory.create!(amount: amount, user_id: user_id, transaction_type: txn_type, status: "success", 
        payment_id: user_stock_id, log: log
      )
    end
  end
end
