Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  get '/', to: 'persons#new'
  post '/', to: 'persons#create'

  get '/admins/dashboard', to: 'admins/dashboard#index'
  get '/admins/dashboard/:person_id/:phase_id', to: 'admins/dashboard/user_phases#show'
  get '/admins/pending_admins', to: 'admins/pending#index'

  get '/admins/login', to: 'admins_sessions#new'
  post '/admins/login', to: 'admins_sessions#create'
  delete '/logout', to: 'admins_sessions#destroy'

  resources :admins, only: [:new, :create]

  get '/:person_id/results', to: 'phases#create'
  get '/:person_id/results/:id', to: 'phases#show'
end


