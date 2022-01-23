class Stock < ApplicationRecord
  has_many :subscriptions
  has_many :user_stocks
  
end
