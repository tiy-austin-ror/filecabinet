Rails.application.routes.draw do
  resources :teams
  get    '/sign_in'     => 'clearance/sessions#new',     as: 'sign_in'
  delete '/sign_out'    => 'clearance/sessions#destroy', as: 'sign_out'
  get    '/sign_up'     => 'clearance/users#new',        as: 'sign_up'

  resources :passwords, controller: 'clearance/passwords', only: [:create, :new]
  resource  :session,   controller: 'clearance/sessions',  only: [:create]
  resources :users,     controller: 'clearance/users' do
    resource  :password,  controller: 'clearance/passwords', only: [:create, :edit, :update]
  end

  resources :taggings
  resources :tags
  resources :photos
  resources :notes
  resources :categories
  resources :permissions

  post :search, controller: 'search', as: 'search'
  root 'dashboard#index', as: 'root'
end
