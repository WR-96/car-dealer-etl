# frozen_string_literal: true

require 'faker'

FactoryBot.define do
  factory :parts_sale_return, class: 'Parts::SaleReturn' do
    client_name { Faker::Name.name }
    date { Faker::Date.between(5.years.ago, Date.today) }
    article { Faker::Vehicle.standard_specs.sample }
    refound { Faker::Commerce.price(300.0..5_000.0) }
    comment { Faker::Lorem.sentence }
  end
end
