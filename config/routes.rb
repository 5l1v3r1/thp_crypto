Rails.application.routes.draw do
  root 'cryptos#index'
  post '/', to: 'cryptos#index'
end
