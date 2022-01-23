module UserStocks
  class StockService

    attr_reader :user_stock, :quantity
    attr_accessor :stock_price

    def initialize(stock_params)
      @user_stock = UserStock.where(stock_id: stock_params[:stock_id], user_id: stock_params[:user_id]).first_or_initialize
      @stock_price = @user_stock.stock.current_price
      @quantity = @user_stock.quantity
      @stock_quantity = stock_params[:quantity].to_i
      
    end

    def call(txn_type = 'purchase')
      ActiveRecord::Base.transaction do
        if txn_type == 'purchase'
          user_stock.amount += @stock_price
          user_stock.quantity += @stock_quantity
        else
          user_stock.amount -= @stock_price
          user_stock.quantity -= @stock_quantity
        end
        
        if user_stock.save
          StockHistory.create!(amount: @stock_price, transaction_type: txn_type, user_stock_id: user_stock.id,
            user_id: user_stock.user_id, quantity_before_transaction: quantity,
            quantity_after_transaction: user_stock.quantity
          )
        end
        user_stock
      end
    end
  end
end
