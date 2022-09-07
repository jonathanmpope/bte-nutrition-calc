Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  get '/', to: 'persons#new'
  post '/', to: 'persons#create'

  get '/admins/login', to: 'admins_sessions#new'
  post '/admins/login', to: 'admins_sessions#create'

  get '/admins/dashboard', to: 'admins/dashboard#index'

  resources :admins, only: [:new, :create ]

  get '/:person_id/results', to: 'phases#create'
  get '/:person_id/results/:id', to: 'phases#show'
end


