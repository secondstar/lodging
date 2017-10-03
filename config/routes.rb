Rails.application.routes.draw do
  root to: 'hotels#index'

  resources :paloozas
  resources :hotels
end
