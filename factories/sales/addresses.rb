# frozen_string_literal: true

require 'faker'

FactoryBot.define do
  factory :sales_address, class: 'Sales::Address' do
    client_name { Faker::Name.name }
    address_line { Faker::Address.street_address }
    city { Faker::Address.city }
    state { Faker::Address.state }
    country { Faker::Address.country }
    zip_code { Faker::Base.numerify('#####') }
  end
end
