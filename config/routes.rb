# frozen_string_literal: true

Rails.application.routes.draw do
  namespace :parts do
    get 'requisitions/extract', to: 'requisitions#extract'
    get 'requisitions/errors', to: 'requisitions#errors'
    resources :requisitions, except: %i[new show]
    get 'supplier_orders/extract', to: 'supplier_orders#extract'
    get 'supplier_orders/errors', to: 'supplier_orders#errors'
    resources :supplier_orders, except: %i[new show]
    get 'provider_returns/extract', to: 'provider_returns#extract'
    get 'provider_returns/errors', to: 'provider_returns#errors'
    resources :provider_returns, except: %i[new show]
    get 'sale_returns/extract', to: 'sale_returns#extract'
    get 'sale_returns/errors', to: 'sale_returns#errors'
    resources :sale_returns, except: %i[new show]
    get 'providers/extract', to: 'providers#extract'
    get 'providers/errors', to: 'providers#errors'
    resources :providers, except: %i[new show]
    get 'spare_parts/extract', to: 'spare_parts#extract'
    get 'spare_parts/errors', to: 'spare_parts#errors'
    resources :spare_parts, except: %i[new show]
    get 'bills/extract', to: 'bills#extract'
    get 'bills/errors', to: 'bills#errors'
    resources :bills, except: %i[new show]
    get 'sales/extract', to: 'sales#extract'
    get 'sales/errors', to: 'sales#errors'
    resources :sales, except: %i[new show]
    get 'employees/extract', to: 'employees#extract'
    get 'employees/errors', to: 'employees#errors'
    resources :employees, except: %i[new show]
    get 'clients/extract', to: 'clients#extract'
    get 'clients/errors', to: 'clients#errors'
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
