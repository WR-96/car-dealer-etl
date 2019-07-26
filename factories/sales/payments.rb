FactoryBot.define do
  statuses = %w[payed paying cancelled]

  factory :sales_payment, class: 'Sales::Payment' do
        client_name { Faker::Name.name }
        status { statuses.sample }
        due_date { Faker::Date.between(5.years.ago, Date.today) }
        payment_date { Faker::Date.between(due_date - 1.week, due_date) }
        amount { Faker::Commerce.price(range = 3_000.0..10_000.0, as_string = true) }
  end
end
