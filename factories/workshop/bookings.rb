FactoryBot.define do
  hour = (9..19).to_a
  minute = (15..45).step(15).to_a

  factory :workshop_booking, class: 'Workshop::Booking' do
    mechanic_name { Faker::Name.name }
    client_name { Faker::Name.name }
    car { Faker::Vehicle.make_and_model }
    date { Faker::Date.between(5.years.ago, Date.today) }
    hour { "#{hour.sample}:#{minute.sample}" }
    description { Faker::Lorem.paragraph }
  end
end
