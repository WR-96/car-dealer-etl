# frozen_string_literal: true

Rails.application.routes.draw do
  namespace :sales do
    resources :employees, except: %i[new show]
  end

  devise_for :users
  root to: 'home#index'
end
