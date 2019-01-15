Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root to: 'pages#index'

  resources :equations, except: [:new]
  resources :individuals

  get 'equations/:id/render_writers', to: 'equations#render_writers'
  get 'equations/:id/add_writer/:writer_id', to: 'equations#add_writer'
  get 'individuals/:id/new_equation', to: 'equations#new'
end
