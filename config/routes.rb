Rails.application.routes.draw do
  root 'posts#index'

  devise_for :users, path: :agents, path_names: { sign_in: :login, sign_out: :logout }
  ActiveAdmin.routes(self)

  # resources :comments

  resources :posts, shallow: true do
    # member do
    #   put 'like' => 'links#like'
    #   put 'dislike' => 'links#dislike'
    # end
    
    resources :comments
  end

  # namespace :admin do
  #   resources :users, only: :index
  #   resources :posts, only: :index
  # end

  get "up" => "rails/health#show", as: :rails_health_check
end
