Rails.application.routes.draw do
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  root "index#index"

  get 'search', to: 'index#search'
  get 'get_search_results', to: 'search#get_search_results', as: :get_search_results
end
