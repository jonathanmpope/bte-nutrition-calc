Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  get '/', to: 'persons#new'
  post '/', to: 'persons#create'

  get '/:person_id/results', to: 'person_phases#create'
end


