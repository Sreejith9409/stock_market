class UserStocksController < ApplicationController

  def index
    render_success_response({
      user_stocks: array_serializer.new(current_user.user_stocks.includes(:stock), serializer: UserStockSerializer)
    })
  end

  def buy_stocks
    user_stock = UserStocks::StockService.new(stock_params).call
    return render_unprocessable_entity(error: user_stock.errors.full_messages) if user_stock.errors.present?
    render_success_response({
      user_stocks: single_serializer.new(user_stock, serializer: UserStockSerializer)
    })
  rescue StandardError => e
    render_unprocessable_entity(error: e.message)
  end

  def sell_stocks
    user_stock = UserStocks::StockService.new(stock_params).call('sold')
    return render_unprocessable_entity(error: user_stock.errors.full_messages) if user_stock.errors.present?
    render_success_response({
      user_stocks: single_serializer.new(user_stock, serializer: UserStockSerializer)
    })
  rescue StandardError => e
    render_unprocessable_entity(error: e.message)
  end

  private

  def stock_params
    params.require(:user_stocks).permit(:stock_id, :quantity).merge(user_id: current_user.id)
  end
end
