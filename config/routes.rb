Rails.application.routes.draw do
  devise_for :users
  root to: 'pages#home'

  resources :instruments, only: %i[index show]
  resources :users, only: %i[index show] do
    resources :applied_instruments, only: %i[index new create]
  end

  resources :applied_instruments, only: :show do
    resources :evaluated_answers, only: %i[new create]
  end

  resources :evaluated_answers, only: %i[edit update]
end
