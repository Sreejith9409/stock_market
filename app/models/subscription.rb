class Subscription < ApplicationRecord
  belongs_to :user
  belongs_to :stock

  validates_uniqueness_of :stock_id, scope: :user_id

  scope :by_stock, -> (stock_id) { where(stock_id: stock_id) }
end
