Rails.application.routes.draw do
  get 'sessions/new'

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  root 'projects#index'

  resources :users do
    resources :projects
  end

  resources :sessions,    only: [:new, :create, :destroy]
  
  resources :projects do
    resources :pledges
  end



end
