Rails.application.routes.draw do
  resources :games

  get 'search', to: 'index#search'
  post 'search/get_search', to: 'search#get_search', as: 'get_search'
  
  root "index#index"
end
