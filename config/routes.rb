Rails.application.routes.draw do
  devise_for :users, defaults: { format: :json }, controllers: {
    sessions: 'users/sessions', registrations: 'users/registrations'
  }
  resources :wallet_histories, only: [:index], defaults: { format: :json }
  resources :payments, only: [:create], defaults: { format: :json }
  resources :stocks, only: [:index], defaults: { format: :json } 

  resources :subscriptions, only: %i[index create], defaults: { format: :json } do
    collection do
      post :remove_subscription
    end
  end

  resources :user_stocks, only: %i[index], defaults: { format: :json } do
    collection do
      post :buy_stocks
      post :sell_stocks
    end
  end

  resources :users, defaults: { format: :json } do
    collection do
      get :portfolio
    end
  end
end