# frozen_string_literal: true

namespace :populate_sales do
  require 'faker'

  task all:  %i[employees clients addresses cars test_drives bills payments deals]

  task employees: :environment do

    200.times do
      name = Faker::Name.first_name
      last_name = Faker::Name.last_name 
      Sales::Employee.create(
        name: name,
        last_name: last_name,
        email: Faker::Internet.free_email("#{name}_#{last_name}"),
        phone: Faker::Base.numerify('3######')
      )
    end
  end

  task clients: :environment do
    200.times do
      name = Faker::Name.name
      Sales::Client.create(
        name: name,
        email: Faker::Internet.free_email(name),
        cellphone: Faker::Base.numerify('312#######'),
        phone: Faker::Base.numerify('3######'),
        rfc: Faker::Base.regexify(/[A-Z]{4}\d\d(0[1-9]|1[012])([0-2]\d|30|31)([A-Z]|\d){3}/)
      )
    end
  end

  task addresses: :environment do
    200.times do
      Sales::Address.create(
        client_name: Faker::Name.name,
        address_line: Faker::Address.street_address,
        city: Faker::Address.city,
        state: Faker::Address.state,
        country: Faker::Address.country,
        zip_code: Faker::Base.numerify('#####')
      )
    end
  end

  task cars: :environment do
    200.times do
      maker = Faker::Vehicle.make
      Sales::Car.create(
        model: Faker::Vehicle.model(maker),
        category: Faker::Vehicle.car_type,
        maker: maker,
        color: Faker::Vehicle.color,
        year: Faker::Date.between(5.years.ago, Date.today).year,
        price: Faker::Commerce.price(range = 100_000.0..500_000.0, as_string = true),
        miles: Faker::Vehicle.mileage(50_000),
        serial_number: Faker::Vehicle.vin,
        purchase_date: Faker::Date.between(5.years.ago, Date.today)
      )
    end
  end

  task test_drives: :environment do
    hour = (9..19).to_a
    minute = (15..45).step(15).to_a

    200.times do
      initial_miles = Faker::Vehicle.mileage(50_000)
      Sales::TestDrive.create(
        client_name: Faker::Name.name,
        agent_name: Faker::Name.name,
        car: Faker::Vehicle.make_and_model,
        date: Faker::Date.between(5.years.ago, Date.today),
        hour: "#{hour.sample}:#{minute.sample}",
        license_number: Faker::Number.number(8),
        inital_miles: initial_miles,
        final_miles: Faker::Vehicle.mileage(initial_miles)
      )
    end
  end

  task deals: :environment do
    200.times do
      Sales::Deal.create(
        client_name: Faker::Name.name,
        agent_name: Faker::Name.name,
        car: Faker::Vehicle.make_and_model,
        price: Faker::Commerce.price(range = 100_000.0..500_000.0, as_string = true),
        date: Faker::Date.between(5.years.ago, Date.today),
        monthly_payment: Faker::Commerce.price(range = 3_000.0..10_000.0, as_string = true),
        payment_due_day: Faker::Number.between(1,25)
      )
    end
  end

  task bills: :environment do
    200.times do
      subtotal = Faker::Commerce.price(range = 100_000.0..500_000.0)
      tax_percentage = 15
      tax_amount = (subtotal * tax_percentage) / 100
      total = subtotal + tax_amount
      Sales::Bill.create(
        client_name: Faker::Name.name,
        rfc: Faker::Base.regexify(/[A-Z]{4}\d\d(0[1-9]|1[012])([0-2]\d|30|31)([A-Z]|\d){3}/),
        date: Faker::Date.between(5.years.ago, Date.today),
        sub_total: subtotal.round(2),
        tax_percentage: tax_percentage,
        tax: tax_amount.round(2),
        total: total.round(2)
      )
    end
  end

  task payments: :environment do
    statuses = %w[payed paying cancelled]
    due_date = Faker::Date.between(5.years.ago, Date.today)
    200.times do
      Sales::Payment.create(
        client_name: Faker::Name.name,
        status: statuses.sample,
        due_date: due_date,
        payment_date: Faker::Date.between(due_date - 1.week, due_date),
        amount: Faker::Commerce.price(range = 3_000.0..10_000.0, as_string = true),
      )
    end
  end

end
