# frozen_string_literal: true

Rails.application.routes.draw do
  resources :likes, except: %i[new edit]
  # RESTful routes
  resources :examples, except: %i[new edit]

  # Custom routes
  post '/users/' => 'users#create'
  patch '/users/:id' => 'users#update'
  get '/users/:id' => 'users#show'
  get '/users/' => 'users#index'
  delete '/users/:id' => 'users#destroy'
  get '/likes/:id' => 'users#show'
  get '/likes/' => 'users#index'
  post '/sign-up' => 'users#signup'
  post '/sign-in' => 'users#signin'
  delete '/sign-out' => 'users#signout'
  patch '/change-password' => 'users#changepw'
end
