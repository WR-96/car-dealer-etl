# frozen_string_literal: true

require 'faker'

FactoryBot.define do
  factory :workshop_client, class: 'Workshop::Client' do
    name { Faker::Name.name }
    phone { Faker::Base.numerify('3######') }
    cellphone { Faker::Base.numerify('312#######') }
    email { Faker::Internet.free_email(name) }
    rfc { Faker::Base.regexify(/[A-Z]{4}\d\d(0[1-9]|1[012])([0-2]\d|30|31)([A-Z]|\d){3}/) }
  end
end
