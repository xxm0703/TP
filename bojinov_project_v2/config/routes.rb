Rails.application.routes.draw do
  root 'documents#index'
  resources :users
  resources :documents
  resources :sessions, only: [:new, :create, :destroy]
  get 'signup', to: 'users#new', as: 'signup'
  get 'login', to: 'sessions#new', as: 'login'
  get 'logout', to: 'sessions#destroy', as: 'logout'
  get '/users/:id/confirm' => 'users#confirm'
  get '/photos/:id/serve/' => 'photos#serve', as: 'serve_photo'
end
