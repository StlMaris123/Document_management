Rails.application.routes.draw do

  root 'fixed_pages#home'

  get 'about' => 'fixed_pages#about'

  get 'help' => 'fixed_pages#help'

  get 'contact' => 'fixed_pages#contact'

  get 'login' => 'sessions#new'

  post 'login' => 'sessions#create'

  delete 'logout' => 'sessions#destroy'


  resources :users

  resources :documents

  resources :account_activations, only: [:edit]
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
