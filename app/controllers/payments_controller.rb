class PaymentsController < ApplicationController

  def create
    # TODO Need to add pg integration and fetch details from pg. 
    payment = Payment.create!(payment_params)
    render json: { payment: payment }
  end

  private

  def payment_params
    params.require(:payment).permit(:amount, :transaction_id, :status).merge(user_id: current_user.id)
  end
end
