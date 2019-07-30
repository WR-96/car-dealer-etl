FactoryBot.define do
  factory :workshop_piece, class: 'Workshop::Piece' do
    car { Faker::Vehicle.model(maker) }
    maker { Faker::Vehicle.make }
    description { Faker::Vehicle.standard_specs.sample }
    price { Faker::Commerce.price(100.0..5_000.0, true) }
  end
end
