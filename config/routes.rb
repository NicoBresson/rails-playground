Rails.application.routes.draw do
  devise_for :users, controllers: { omniauth_callbacks: 'users/omniauth_callbacks' }
  root to: 'pages#home'
  get '/search', to: 'pages#search'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  resources :users, only: [:show, :edit, :update]
  resources :schools, only: [:show]
  resources :toys do
    resources :transactions , only: [:index, :new, :create]
  end
  mount Attachinary::Engine => "/attachinary"
end
