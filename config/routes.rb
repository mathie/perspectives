Rails.application.routes.draw do
  [ :inbox, :projects ].each do |perspective|
    resources "#{perspective}_perspectives", only: [ :show, :new, :create, :edit, :update ]
  end
  resources :perspectives, only: [ :index, :new, :destroy ]

  root to: 'pages#index'
end
