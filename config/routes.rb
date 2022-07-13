Rails.application.routes.draw do
  get '/authors', to: 'authors#index'
  get '/authors/new', to: 'authors#new'
  post '/authors', to: 'authors#create'
  get '/authors/:id', to: 'authors#show'
  get '/authors/:id/edit', to: 'authors#edit'
  patch '/authors/:id', to: 'authors#update'
  delete '/authors/:id', to: 'authors#delete'
  delete '/authors', to: 'authors#delete'


  get '/mangas', to: 'mangas#index'
  get '/mangas/:id', to: 'mangas#show'
  get '/mangas/:id/edit', to: 'mangas#edit'
  patch '/mangas/:id', to: 'mangas#update'
  delete '/mangas', to: 'mangas#delete'
  delete '/mangas/:id', to: 'mangas#delete'

  get '/authors/:author_id/mangas/new', to: 'author_mangas#new'
  post '/authors/:author_id/mangas', to: 'author_mangas#create'
  get '/authors/:author_id/mangas', to: 'author_mangas#index'
end
