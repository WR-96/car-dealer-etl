# frozen_string_literal: true

require 'faker'

FactoryBot.define do
  factory :sales_client, class: 'Sales::Client' do
    name { Faker::Name.name }
    email { Faker::Internet.free_email(name) }
    cellphone { Faker::Base.numerify('312#######') }
    phone { Faker::Base.numerify('3######') }
    rfc { Faker::Base.regexify(/[A-Z]{4}\d\d(0[1-9]|1[012])([0-2]\d|30|31)([A-Z]|\d){3}/) }
  end
end
