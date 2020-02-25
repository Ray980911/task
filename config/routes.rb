Rails.application.routes.draw do

  root 'static_pages#home'

  resources :tasks
# urlの変更（大まかに）
  devise_for :users, :controllers => {
    :registrations => 'users/registrations',
    :sessions => 'users/sessions'
  }
# urlの変更（詳細に）
  devise_scope :user do
    get "user/:id", :to => "users/registrations#show"
    get "users", :to => "users/registrations#index"
    get "sign_in", :to => "users/sessions#new"
    get "sign_out", :to => "users/sessions#destroy"
  end

end
