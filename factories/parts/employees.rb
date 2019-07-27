# frozen_string_literal: true

require 'faker'

FactoryBot.define do
  factory :parts_employee, class: 'Parts::Employee' do
    name { Faker::Name.name }
    phone { Faker::Base.numerify('3######') }
    cellphone { Faker::Base.numerify('312#######') }
    email { Faker::Internet.free_email(name) }
  end
end
