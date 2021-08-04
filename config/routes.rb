Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

resources :competitions
resources :teams

get "/competitions/:id/new", to: 'competitions#new'
post "/competitions/:id/events", to: 'events#create'


end
