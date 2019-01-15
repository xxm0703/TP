Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  get '/' => 'pages#index'

  resources :equations
  resources :individuals

  get 'equations/:id/render_writers', to: 'equations#render_writers'
  get 'equations/:id/add_writer/:writer_id', to: 'equations#add_writer'
end
