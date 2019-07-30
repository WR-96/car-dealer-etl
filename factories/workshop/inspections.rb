FactoryBot.define do
  fuel_levels = %w[reserve low quarter medium high full]

  factory :workshop_inspection, class: 'Workshop::Inspection' do
    car { Faker::Vehicle.make_and_model }
    mechanic_name { Faker::Name.name }
    date { Faker::Date.between(5.years.ago, Date.today) }
    mileage { Faker::Vehicle.mileage(50_000, 250_000) }
    fuel_level { fuel_levels.sample }
    comment { Faker::Lorem.paragraph }
  end
end
