class Payment < ApplicationRecord
  belongs_to :user

  validates :transaction_id, uniqueness: true

  after_create :credit_wallet_history

  scope :authorized, -> { where(status: 'authorized') }

  def credit_wallet_history
    WalletHistory.create!(amount: amount, user_id: user_id, transaction_type: 'credit', status: status, 
      payment_id: id
    )
  end

end
