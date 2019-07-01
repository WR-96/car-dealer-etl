# frozen_string_literal: true

Rails.application.routes.draw do
  namespace :sales do
    resources :cars, except: %i[new show]
    resources :addresses, except: %i[new show]
    resources :employees, except: %i[new show]
  end

  devise_for :users
  root to: 'home#index'
end
