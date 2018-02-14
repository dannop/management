Rails.application.routes.draw do

  #Página Inicial
  root to: 'sessions#new'

  #Login normal
  get 'sessions/new'
  get    '/login',   to: 'sessions#new'
  post   '/login',   to: 'sessions#create'
  delete '/logout',  to: 'sessions#destroy'

  #Registro de usuários nos times
  get '/users_teams', to: 'users_team#index', as: :users_teams
  post '/users_teams', to: 'users_team#create'
  get '/users_teams/new', to: 'users_team#new', as: :new_users_team
  get '/users_teams/:id/edit', to: 'users_team#edit', as: :edit_users_team
  get '/users_teams/:id', to: 'users_team#show', as: :users_team
  patch '/users_teams/:id', to: 'users_team#update'
  put '/users_teams/:id', to: 'users_team#update'
  delete '/users_teams/:id', to: 'users_team#destroy'
  patch 'teams/:id/add_users_team', to: 'teams#add_users_team', as: :add_users_team

  #Rotas criadas pelo Scaffold
  resources :directories
  resources :tasks
  resources :goals
  resources :projects
  resources :teams
  resources :users
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
