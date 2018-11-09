Rails.application.routes.draw do
  resources :equations
  resources :individuals
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
	get '/' => "pages#index"
end
