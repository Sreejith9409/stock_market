class SubscriptionsController < ApplicationController
  def index
    render_success_response({
      subscription: array_serializer.new(current_user.subscriptions.includes(:stock), serializer: SubscriptionSerializer)
    })
  end

  def create
    subscription = Subscription.create!(subscription_params)
    render_success_response({
      subscription: single_serializer.new(subscription, serializer: SubscriptionSerializer)
    })
  rescue StandardError => e
    render_unprocessable_entity(error: e.message)
  end

  def remove_subscription
    subscription = Subscription.find_by_id(params[:id]).delete
    render_success_response({
      subscription: single_serializer.new(subscription, serializer: SubscriptionSerializer)
    })
  rescue StandardError => e
    render_unprocessable_entity(error: e.message)
  end

  private

  def subscription_params
    params.require(:subscriptions).permit(:stock_id).merge(user_id: current_user.id)
  end
end
