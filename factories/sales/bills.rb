# frozen_string_literal: true

require 'faker'

FactoryBot.define do
  factory :sales_bill, class: 'Sales::Bill' do
    client_name { Faker::Name.name }
    rfc { Faker::Base.regexify(/[A-Z]{4}\d\d(0[1-9]|1[012])([0-2]\d|30|31)([A-Z]|\d){3}/) }
    date { Faker::Date.between(5.years.ago, Date.today) }
    sub_total { Faker::Commerce.price(100_000.0..500_000.0).round(2) }
    tax_percentage { 15.0 }
    tax { (sub_total * tax_percentage.to_f / 100).round(2) }
    total { (sub_total + tax).round(2) }
  end
end
