class StocksController < ApplicationController

  def index
    render_success_response({
      stocks: array_serializer.new(Stock.all, serializer: StockSerializer)
    })
  end

end
