Rails.application.routes.draw do

  scope '/api' do
    resources :conversations
    resources :messages

    get '/users', to: 'users#index'
    get '/users/current', to: 'users#current'
    get '/users/conversations', to: 'users#conversations'
    get '/conversations/:id/messages', to: 'conversations#messages'
    post 'authenticate', to: 'authentication#authenticate'
  end

  mount ActionCable.server => '/cable'
  
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
