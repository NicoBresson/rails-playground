Rails.application.routes.draw do
  get 'schools/show'

  devise_for :users, controllers: { omniauth_callbacks: 'users/omniauth_callbacks' }
  root to: 'pages#home'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  resources :schools, only: [:show]
  resources :toys do
    resources :transactions , only: [:index, :new, :create]
  end
end
