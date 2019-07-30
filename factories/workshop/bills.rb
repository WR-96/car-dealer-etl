FactoryBot.define do
  factory :workshop_bill, class: 'Workshop::Bill' do
    client_name { Faker::Name.name }
    rfc { Faker::Base.regexify(/[A-Z]{4}\d\d(0[1-9]|1[012])([0-2]\d|30|31)([A-Z]|\d){3}/) }
    date { Faker::Date.between(5.years.ago, Date.today) }
    service { Faker::Lorem.paragraph }
    sub_total { Faker::Commerce.price(1_000.0..10_000.0) }
    tax_percentage { 15 }
    tax_amount { (sub_total * tax_percentage / 100).round(2) }
    total { (sub_total + tax_amount).round(2) }
  end
end
