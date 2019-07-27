# frozen_string_literal: true

require 'faker'

FactoryBot.define do
  factory :parts_sale, class: 'Parts::Sale' do
    client_name { Faker::Name.name }
    employee_name { Faker::Name.name }
    date { Faker::Date.between(5.years.ago, Date.today) }
    product { Faker::Vehicle.standard_specs.sample }
    amount { Faker::Number.within(1..10) }
    price { Faker::Commerce.price(300.0..5_000.0) }
    total { (price * amount).round(2) }
  end
end
