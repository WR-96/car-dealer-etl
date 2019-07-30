FactoryBot.define do
  factory :workshop_mechanic, class: 'Workshop::Mechanic' do
    name { Faker::Name.name }
    phone { Faker::Base.numerify('3######') }
    cellphone { Faker::Base.numerify('312#######') }
    email { Faker::Internet.free_email(name) }
  end
end
