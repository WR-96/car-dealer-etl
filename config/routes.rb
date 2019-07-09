# frozen_string_literal: true

Rails.application.routes.draw do
  namespace :parts do
    resources :clients, except: %i[new show]
  end

  namespace :workshop do
    resources :inspection_points, except: %i[new show]
    resources :inspections, except: %i[new show]
    resources :bills, except: %i[new show]
    resources :repairs, except: %i[new show]
    resources :mechanics, except: %i[new show]
    resources :pieces, except: %i[new show]
    resources :bookings, except: %i[new show]
    resources :cars, except: %i[new show]
    resources :clients, except: %i[new show]
  end

  namespace :sales do
    resources :clients, except: %i[new show]
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
