Rails.application.routes.draw do
  resources :games

  get 'search', to: 'index#search'
  put 'search/get_search_results', to: 'search#get_search_results', as: 'get_search_results'
  
  root "index#index"
end
