Rails.application.routes.draw do

  get '/login', to: 'sessions#new'

  get '/create', to: 'sessions#create'

  get '/destroy', to: 'sessions#destroy'

 

  root 'static_page#home'

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
