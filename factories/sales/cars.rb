# frozen_string_literal: true

require 'faker'

FactoryBot.define do
  factory :sales_car, class: 'Sales::Car' do
    model { Faker::Vehicle.model(maker) }
    category { Faker::Vehicle.car_type }
    maker { Faker::Vehicle.make }
    color { Faker::Vehicle.color }
    year { Faker::Date.between(5.years.ago, Date.today).year }
    price { Faker::Commerce.price(100_000.0..500_000.0, true) }
    miles { Faker::Vehicle.mileage(50_000) }
    serial_number { Faker::Vehicle.vin }
    purchase_date { Faker::Date.between(5.years.ago, Date.today) }
  end
end
