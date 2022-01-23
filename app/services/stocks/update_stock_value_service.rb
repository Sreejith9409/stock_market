module Stocks
  class UpdateStockValueService

    def call
      Stock.all.each do |stock|
        stock.current_price = Faker::Number.within(range: 1..10000)
        stock.save!
      end
    end
  end
end
