Rails.application.routes.draw do

  root 'static_pages#home'
  get '/tasks/users/:id', to: 'tasks#mytask'
  get '/tasks/:id/assign', to: 'tasks#assign'

  resources :tasks
  
  devise_for :users, :controllers => {
    :registrations => 'users/registrations',
    :sessions => 'users/sessions'
  }
  devise_scope :user do
    get "users/:id", :to => "users/registrations#show"
    get "sign_up", :to => "users/registrations#new"
    get "sign_in", :to => "users/sessions#new"
    get "sign_out", :to => "users/sessions#destroy"
  end

  if Rails.env.development?
    mount LetterOpenerWeb::Engine, at: "/letter_opener"
  end

end
