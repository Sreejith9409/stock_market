class WalletHistory < ApplicationRecord
  STATUS = %w[authorized failure cancelled rejected success]

  belongs_to :user
  belongs_to :payment, optional: true

  validates :amount, presence: true
  validates :transaction_type, inclusion: { in: %w[credit debit] }, presence: true

  has_one :invoice, dependent: :destroy

  before_create :adjust_wallet_balance

  enum status: Hash[STATUS.zip(STATUS)]

  def adjust_wallet_balance
    ActiveRecord::Base.transaction do
      self.log = self.inspect
      if transaction_type.eql?("debit")
        self.wallet_before_transaction = user.wallet_amount
        self.wallet_after_transaction = user.wallet_amount - amount
      elsif transaction_type.eql?("credit")
        self.wallet_before_transaction = user.wallet_amount
        self.wallet_after_transaction = user.wallet_amount + amount
      end
      user.update!(wallet_amount: wallet_after_transaction) if status.eql?("success")
    end
  end
end
