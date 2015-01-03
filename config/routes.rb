Rails.application.routes.draw do
  resources :perspectives, :inbox_perspectives

  root to: 'pages#index'
end
