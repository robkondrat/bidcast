Rails.application.routes.draw do
  namespace :api do
    get '/users' => 'users#index'
    post '/users' => 'users#create'
    get '/users/:id' => 'users#show'
    patch '/users/:id' => 'users#update'
    delete '/users/:id' => 'users#destroy'

    get '/podcasts' => 'podcasts#index'
    post '/podcasts' => 'podcasts#create'
    get '/podcasts/:id' => 'podcasts#show'
    patch '/podcasts/:id' => 'podcasts#update'
    delete '/podcasts/:id' => 'podcasts#destroy'

    get '/advertisers' => 'advertisers#index'
    post '/advertisers' => 'advertisers#create'
    get '/advertisers/:id' => 'advertisers#show'
    patch '/advertisers/:id' => 'advertisers#update'
    delete '/advertisers/:id' => 'advertisers#destroy'

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

    get '/messages' => 'messages#index'
    post '/messages' => 'messages#create'
    get '/messages/:id' => 'messages#show'

  end
end
