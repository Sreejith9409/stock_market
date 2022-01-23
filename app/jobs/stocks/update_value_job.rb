module Stocks
  class UpdateValueJob
    include Sidekiq::Worker
    sidekiq_options queue: "cron", retry: false

    def perform
      Stocks::UpdateStockValueService.new.call
    end
  end
end
