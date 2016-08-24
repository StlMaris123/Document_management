Rails.application.routes.draw do

  get 'password_resets/new'

  get 'password_resets/edit'

  root 'fixed_pages#home'

  get 'about' => 'fixed_pages#about'

  get 'help' => 'fixed_pages#help'

  get 'login' => 'sessions#new'

  post 'login' => 'sessions#create'

  delete 'logout' => 'sessions#destroy'


  resources :users

  resources :documents

  resources :account_activations, only: [:edit]

  resources  :password_resets,    only: [:new, :create, :edit, :update]
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
