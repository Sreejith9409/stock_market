class UserStock < ApplicationRecord
  belongs_to :user
  belongs_to :stock
  has_many :stock_histories

  validates :quantity, presence: true, numericality: { greater_than_or_equal_to: 0 } 
end
