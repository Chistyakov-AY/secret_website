# frozen_string_literal: true

Rails.application.routes.draw do
  devise_for :admin_users, ActiveAdmin::Devise.config
  root 'posts#index'

  devise_for :users, path: :agents, path_names: { sign_in: :login, sign_out: :logout }
  ActiveAdmin.routes(self)

  resources :posts, shallow: true do
    resources :comments
  end

  get 'my_posts', to: 'posts#my_posts'

  get 'up' => 'rails/health#show', as: :rails_health_check
end
