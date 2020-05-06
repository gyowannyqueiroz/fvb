Rails.application.routes.draw do
  root to: 'pages#home'
  resources :currencies
  resources :clients
  resources :accounts
  resources :account_transactions
end
