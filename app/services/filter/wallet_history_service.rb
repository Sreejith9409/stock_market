module Filter
  #class for handling filters for wallet transactions.
  class WalletHistoryService

    attr_reader :current_user

    include Pagy::Backend

    def initialize(current_user)
      @current_user = current_user
    end

    def call(params)
      begin
        page = params[:page] || 1
        pagy, wallet_histories = pagy(
          current_user.wallet_histories.where(wallet_history_conditions(params)).order(created_at: :desc),
          page: page, items: params[:items] || 15
        )
        wallet_histories
      rescue Pagy::OverflowError => error
        []
      end
    end

    private

    def wallet_history_conditions(params)
      conditions = []
      transaction_type, transaction_days = params[:transaction_type], params[:transaction_days]
      if transaction_type.present?
        conditions << "transaction_type = '#{transaction_type}'"
      end
      conditions << transaction_days_conditions(transaction_days) if transaction_days.present? && transaction_days != 'all'
      conditions.join(" and ")
    end

    def transaction_days_conditions(transaction_days)
      present_time = Time.zone.now
      start_time = (present_time - transaction_days.to_i.days)
      end_time = present_time
      condition = "created_at between '#{start_time}' and '#{end_time}'"
      condition
    end
  end
end
