Rails.application.routes.draw do
  get '/authors', to: 'authors#index'
  get '/authors/:id', to: 'authors#show'
  get '/mangas', to: 'mangas#index'
  get '/mangas/:id', to: 'mangas#show'
end
