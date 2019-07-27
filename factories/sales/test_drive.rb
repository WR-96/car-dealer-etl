# frozen_string_literal: true

require 'faker'

FactoryBot.define do
  hours = (9..19).to_a
  minutes = (15..45).step(15).to_a

  factory :sales_test_drive, class: 'Sales::TestDrive' do
    client_name { Faker::Name.name }
    agent_name { Faker::Name.name }
    car { Faker::Vehicle.make_and_model }
    date { Faker::Date.between(5.years.ago, Date.today) }
    hour { "#{hours.sample}:#{minutes.sample}" }
    license_number { Faker::Number.number(8) }
    inital_miles { Faker::Vehicle.mileage(50_000) }
    final_miles { Faker::Vehicle.mileage(inital_miles) }
  end
end
