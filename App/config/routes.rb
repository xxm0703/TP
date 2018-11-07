Rails.application.routes.draw do
  resources :individuals
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
	resources :equations
	get '/' => 'equation#index'
end
