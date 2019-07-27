# frozen_string_literal: true

require 'faker'

FactoryBot.define do
  statuses = %w[shipped pending delivered canceled]

  factory :parts_supplier_order, class: 'Parts::SupplierOrder' do
    employee_name { Faker::Name.name }
    date { Faker::Date.between(5.year.ago, Date.today) }
    supplier_tradename { Faker::Company.name }
    status { statuses.sample }
    delivery_date { Faker::Date.between(date + 1.weeks, date + 3.weeks) }
    article { Faker::Vehicle.standard_specs.sample }
    price { Faker::Commerce.price(300.0..5_000.0) }
    amount { Faker::Number.within(100..1_000) }
    total { (amount * price).round(2) }
  end
end
