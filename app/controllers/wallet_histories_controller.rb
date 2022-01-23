class WalletHistoriesController < ApplicationController
  def index
    wallet_histories = Filter::WalletHistoryService.new(current_user).call(params)
    render_success_response(
      {
        wallet_histories: array_serializer.new(wallet_histories, serializer: WalletHistorySerializer),
        walllet_amount: current_user.wallet_amount.round(2)
      }
    )
  rescue StandardError => e
    render_unprocessable_entity(e.message)
  end
end
