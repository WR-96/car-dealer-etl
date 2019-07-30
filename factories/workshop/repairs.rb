FactoryBot.define do
  factory :workshop_repair, class: 'Workshop::Repair' do
    date { Faker::Date.between(5.years.ago, Date.today) }
    mechanic_name { Faker::Name.name }
    car { Faker::Vehicle.make_and_model }
    description { Faker::Lorem.sentence }
    total { Faker::Commerce.price(1_000.0..15_000.0, true) }
  end
end
