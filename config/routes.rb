Rails.application.routes.draw do
  devise_for :users
  root to: 'pages#home'

  resources :instruments, only: %i[index show]
  resources :profiles, only: %i[index show]
end
