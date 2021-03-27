Rails.application.routes.draw do
  # home
  root to: 'home#top'

  # session
  get '/login' => 'session#new'
  post '/login' => 'session#create'
  delete '/logout' => 'session#destroy'

  # room
  get 'rooms/search' => 'rooms#search', as: 'search_room'
  # get 'rooms/search/:area/:keyword' => 'rooms#search', as: 'search_room'
  get 'rooms/posts' => 'rooms#posts'
  get 'rooms/reserve/:id' => 'rooms#reserve', as: 'reserve_room'
  resources :rooms, only: %i[new create]

  # user
  get 'users/account' => 'users#show'
  get 'users/profile' => 'users#profile'
  post 'users/profile' => 'users#change_profile'
  get 'users/edit' => 'users#edit'
  resources :users, only: %i[new create update]

  # reservations
  get 'reservations/posts' => 'reservations#posts'
  resources :reservations, only: %i[new create]
  get 'reservations/:id' => 'reservations#created', as: 'created_reservation'
end
