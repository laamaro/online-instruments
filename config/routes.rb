Rails.application.routes.draw do
  devise_for :users
  root to: 'pages#home'

  resources :instruments, only: %i[index show]
  resources :users, only: %i[index] do
    resources :applied_instruments, only: %i[index new create]
  end

  get '/profile/:id', to: 'users#profile', as: 'profile'

  resources :applied_instruments, only: :show do
    post 'finish_instrument', to: 'applied_instruments#finish_instrument'
    resources :evaluated_answers, only: %i[new create]
  end

  resources :evaluated_answers, only: %i[edit update]
end
