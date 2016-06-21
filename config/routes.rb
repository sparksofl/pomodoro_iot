Rails.application.routes.draw do
  resources :pomodoros, except: [:new, :edit]
  resources :timers, except: [:new, :edit]
  devise_for :user, only: []

  namespace :v1, defaults: { format: :json } do
    resource :login, only: [:create], controller: :sessions
    resources :users, only: [:create]
    resources :stories, only: [:index, :show, :create]
    resources :tasks
    get 'names' => 'tasks#names'
  end
end
