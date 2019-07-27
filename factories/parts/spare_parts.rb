# frozen_string_literal: true

require 'faker'

FactoryBot.define do
  factory :parts_spare_part, class: 'Parts::SparePart' do
    description { Faker::Vehicle.standard_specs.sample }
    car_model { Faker::Vehicle.model(car_maker) }
    car_maker { Faker::Vehicle.make }
    price { Faker::Commerce.price(300.0..5_000.0) }
    stock { Faker::Number.within(10..100) }
    reorder { Faker::Number.within(5..20) }
  end
end
