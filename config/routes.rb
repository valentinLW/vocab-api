Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  scope '/api/v1' do
    post '/login', to: 'users#login'
    post '/signup', to: 'users#signup'
    get 'boxes', to: 'boxes#index'
    post 'boxes/new', to: 'boxes#new'
    get 'boxes/:id', to: 'boxes#show'
    get 'boxes/:id/reset', to: 'boxes#reset'
    get 'boxes/:id/mastery', to: 'boxes#mastery'
    get 'mastery', to: 'mastery#show'
    get 'masteries', to: 'mastery#index'
    patch 'mastery/:id', to: 'mastery#update'
    delete 'boxes/:id', to: 'boxes#delete'
    patch 'cards/:id', to: 'cards#update'
    delete 'cards/:id', to: 'cards#destroy'
    post 'cards/new', to: 'cards#new'
    post 'cards/new_batch', to: 'cards#new_batch'
    patch 'slots/:id', to: 'slots#update'
  end
end
