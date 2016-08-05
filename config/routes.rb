Rails.application.routes.draw do
  resources :taggings
  resources :tags
  resources :photos
  resources :notes
  resources :categories

  resources :passwords, controller: 'passwords', only: [:create, :new]
  resource  :session,   controller: 'sessions',  only: [:create]
  resources :users,     controller: 'users',     only: Clearance.configuration.user_actions do
    resource  :password,  controller: 'passwords', only: [:create, :edit, :update]
  end

  get    '/sign_in'     => 'sessions#new',     as: 'sign_in'
  delete '/sign_out'    => 'sessions#destroy', as: 'sign_out'
  get    '/sign_up'     => 'users#new',        as: 'sign_up'

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
