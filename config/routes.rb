Rails.application.routes.draw do
  get 'users/new'

  root 'fixed_pages#home'

  get 'about' => 'fixed_pages#about'

  get 'help' => 'fixed_pages#help'

  get 'contact' => 'fixed_pages#contact'

  resources :users
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
