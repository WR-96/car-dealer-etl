# frozen_string_literal: true

Rails.application.routes.draw do
  namespace :parts do
    resources :requisitions, except: %i[new show]
    resources :supplier_orders, except: %i[new show]
    resources :provider_returns, except: %i[new show]
    resources :sale_returns, except: %i[new show]
    resources :providers, except: %i[new show]
    resources :spare_parts, except: %i[new show]
    resources :bills, except: %i[new show]
    resources :sales, except: %i[new show]
    resources :employees, except: %i[new show]
    resources :clients, except: %i[new show]
  end

  namespace :workshop do
    get 'inspections/extract', to: 'inspections#extract'
    get 'inspections/errors', to: 'inspections#errors'
    resources :inspections, except: %i[new show]
    get 'bills/extract', to: 'bills#extract'
    get 'bills/errors', to: 'bills#errors'
    resources :bills, except: %i[new show]
    get 'repairs/extract', to: 'repairs#extract'
    get 'repairs/errors', to: 'repairs#errors'
    resources :repairs, except: %i[new show]
    get 'mechanics/extract', to: 'mechanics#extract'
    get 'mechanics/errors', to: 'mechanics#errors'
    resources :mechanics, except: %i[new show]
    get 'pieces/extract', to: 'pieces#extract'
    get 'pieces/errors', to: 'pieces#errors'
    resources :pieces, except: %i[new show]
    get 'bookings/extract', to: 'bookings#extract'
    get 'bookings/errors', to: 'bookings#errors'
    resources :bookings, except: %i[new show]
    get 'cars/extract', to: 'cars#extract'
    get 'cars/errors', to: 'cars#errors'
    resources :cars, except: %i[new show]
    get 'clients/extract', to: 'clients#extract'
    get 'clients/errors', to: 'clients#errors'
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
