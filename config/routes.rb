# frozen_string_literal: true

Rails.application.routes.draw do
  namespace :sales do
    resources :payments, except: %i[new show]
    resources :bills, except: %i[new show]
    resources :deals, except: %i[new show]
    resources :test_drives, except: %i[new show]
    resources :cars, except: %i[new show]
    resources :addresses, except: %i[new show]
    resources :employees, except: %i[new show]
  end

  devise_for :users
  root to: 'home#index'
end
