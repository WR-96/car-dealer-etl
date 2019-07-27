# frozen_string_literal: true

require 'faker'

FactoryBot.define do
  factory :sales_employee, class: 'Sales::Employee' do
    name { Faker::Name.first_name }
    last_name { Faker::Name.last_name }
    email { Faker::Internet.free_email }
    phone { Faker::Base.numerify('3######') }
  end
end
