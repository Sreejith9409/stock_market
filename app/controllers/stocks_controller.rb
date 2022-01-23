class StocksController < ApplicationController

  def index
    render_success_response({
      document: array_serializer.new(Stock.all, serializer: StockSerializer)
    })
  end

end
