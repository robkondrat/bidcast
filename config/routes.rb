Rails.application.routes.draw do
  namespace :api do
    get '/users' => 'users#index'
    post '/users' => 'users#create'
    get '/users/:id' => 'users#show'
    patch '/users/:id' => 'users#update'
    delete '/users/:id' => 'users#destroy'

    post '/sessions' => 'sessions#create'


    get '/spaces' => 'spaces#index'
    post '/spaces' => 'spaces#create'
    get '/spaces/:id' => 'spaces#show'
    patch '/spaces/:id' => 'spaces#update'
    delete '/spaces/:id' => 'spaces#destroy'

    get '/bids' => 'bids#index'
    post '/bids' => 'bids#create'
    get '/bids/:id' => 'bids#show'
    patch '/bids/:id' => 'bids#update'
    delete '/bids/:id' => 'bids#destroy'

  end
end
