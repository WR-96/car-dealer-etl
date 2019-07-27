# frozen_string_literal: true

require 'faker'

FactoryBot.define do
  factory :parts_bill, class: 'Parts::Bill' do
    client_name { Faker::Name.name }
    rfc { Faker::Base.regexify(/[A-Z]{4}\d\d(0[1-9]|1[012])([0-2]\d|30|31)([A-Z]|\d){3}/) }
    date { Faker::Date.between(5.years.ago, Date.today) }
    product { Faker::Vehicle.standard_specs.sample }
    amount { Faker::Number.within(1..10) }
    price { Faker::Commerce.price(300.0..5_000.0) }
    sub_total { (price * amount).round(2) }
    tax_percentage { 15 }
    tax_amount { (sub_total * tax_percentage / 100).round(2) }
    total { (sub_total + tax_amount).round(2) }
  end
end
