FactoryBot.define do
  factory :workshop_car, class: 'Workshop::Car' do
    client_name { Faker::Name.name }
    car { Faker::Vehicle.model(maker) }
    maker { Faker::Vehicle.make }
    color { Faker::Vehicle.color }
    year { Faker::Vehicle.year }
    license_plate { Faker::Vehicle.license_plate }
    serial_number { Faker::Vehicle.vin }
  end
end
