Rails.application.routes.draw do
  root 'urls#index'
  get '/urls/:id/short' => 'urls#short'

  resources :urls, only: [:index, :new, :create, :show]
end
