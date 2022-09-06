Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  get '/', to: 'persons#new'
  post '/', to: 'persons#create'

  get '/admins/new', to: 'admins#new'
  post '/admins/new', to: 'admins#create'
  get '/admins/:id', to: 'admins#index'

  get '/:person_id/results', to: 'phases#create'
  get '/:person_id/results/:id', to: 'phases#show'
end


