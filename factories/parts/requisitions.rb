# frozen_string_literal: true

require 'faker'

FactoryBot.define do
  statuses = %w[shipped pending delivered canceled]

  factory :parts_requisition, class: 'Parts::Requisition' do
    employee_name { Faker::Name.name }
    date { Faker::Date.between(5.year.ago, Date.today) }
    status { statuses.sample }
    delivery_date { Faker::Date.between(date + 1.weeks, date + 3.weeks) }
    article { Faker::Vehicle.standard_specs.sample }
    amount { Faker::Number.within(10..100) }
  end
end
