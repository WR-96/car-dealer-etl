# frozen_string_literal: true

require 'faker'

FactoryBot.define do
  factory :sales_deal, class: 'Sales::Deal' do
    client_name { Faker::Name.name }
    agent_name { Faker::Name.name }
    car { Faker::Vehicle.make_and_model }
    price { Faker::Commerce.price(range = 100_000.0..500_000.0, as_string = true) }
    date { Faker::Date.between(5.years.ago, Date.today) }
    monthly_payment { Faker::Commerce.price(range = 3_000.0..10_000.0, as_string = true) }
    payment_due_day { Faker::Number.between(1,25) }
  end
end
