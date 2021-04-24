Rails.application.routes.draw do
  get '/', to: 'home#top'
  get '/u_must', to: 'home#u_must_do'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  get 'posts/new', to: 'posts#new'
  get 'posts/index', to: 'posts#index'
  post 'posts/create', to: 'posts#create'
  get 'posts/:id/edit', to: 'posts#edit'
  patch 'posts/:id/update', to: 'posts#update'
  delete 'posts/:id/delete', to: 'posts#delete'
end
