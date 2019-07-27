# frozen_string_literal: true

require 'faker'

FactoryBot.define do
  factory :parts_provider, class: 'Parts::Provider' do
    tradename { Faker::Company.name }
    phone { Faker::Base.numerify('3######') }
    cellphone { Faker::Base.numerify('312#######') }
    email { Faker::Internet.free_email }
    car_maker { Faker::Vehicle.make }
    piece { Faker::Vehicle.standard_specs.sample }
    price { Faker::Commerce.price(300.0..5_000.0) }
  end
end
