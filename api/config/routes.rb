Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  scope '/api/v1' do
    get 'boxes', to: 'boxes#index'
    get 'boxes/:id', to: 'boxes#show'
  end
end
