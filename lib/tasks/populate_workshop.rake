# frozen_string_literal: true

namespace :populate_workshop do
  require 'faker'

  task all: %i[clients cars bookings pieces mechanics repairs bills inspections]

  task clients: :environment do
    250.times do
      name = Faker::Name.name
      Workshop::Client.create(
        name: name,
        phone: Faker::Base.numerify('3######'),
        cellphone: Faker::Base.numerify('312#######'),
        email: Faker::Internet.free_email(name),
        rfc: Faker::Base.regexify(/[A-Z]{4}\d\d(0[1-9]|1[012])([0-2]\d|30|31)([A-Z]|\d){3}/)
      )
    end
  end

  task cars: :environment do
    250.times do
      maker = Faker::Vehicle.make
      Workshop::Car.create(
        client_name: Faker::Name.name,
        car: Faker::Vehicle.model(maker),
        maker: maker,
        color: Faker::Vehicle.color,
        year: Faker::Vehicle.year,
        license_plate: Faker::Vehicle.license_plate,
        serial_number: Faker::Vehicle.vin
      )
    end
  end

  task bookings: :environment do
    250.times do
      hour = (9..19).to_a
      minute = (15..45).step(15).to_a

      Workshop::Booking.create(
        mechanic_name: Faker::Name.name,
        client_name: Faker::Name.name,
        car: Faker::Vehicle.make_and_model,
        date: Faker::Date.between(5.years.ago, Date.today),
        hour: "#{hour.sample}:#{minute.sample}",
        description: Faker::Lorem.paragraph
      )
    end
  end

  task pieces: :environment do
    250.times do
      maker = Faker::Vehicle.make
      Workshop::Piece.create(
        car: Faker::Vehicle.model(maker),
        maker: maker,
        description: Faker::Vehicle.standard_specs.sample,
        price: Faker::Commerce.price(100.0..5_000.0, true)
      )
    end
  end

  task mechanics: :environment do
    250.times do
      name = Faker::Name.name
      Workshop::Mechanic.create(
        name: name,
        phone: Faker::Base.numerify('3######'),
        cellphone: Faker::Base.numerify('312#######'),
        email: Faker::Internet.free_email(name),
      )
    end
  end

  task repairs: :environment do
    250.times do
      Workshop::Repair.create(
        date: Faker::Date.between(5.years.ago, Date.today),
        mechanic_name: Faker::Name.name,
        car: Faker::Vehicle.make_and_model,
        description: Faker::Lorem.sentence,
        total: Faker::Commerce.price(1_000.0..15_000.0, true)
      )
    end
  end

  task bills: :environment do
    250.times do
      subtotal = Faker::Commerce.price(range = 100_000.0..500_000.0)
      tax_percentage = 15
      tax_amount = (subtotal * tax_percentage) / 100
      total = subtotal + tax_amount
      Workshop::Bill.create(
        client_name: Faker::Name.name,
        rfc: Faker::Base.regexify(/[A-Z]{4}\d\d(0[1-9]|1[012])([0-2]\d|30|31)([A-Z]|\d){3}/),
        date: Faker::Date.between(5.years.ago, Date.today),
        sub_total: subtotal.round(2),
        tax_percentage: tax_percentage,
        tax_amount: tax_amount.round(2),
        total: total.round(2)
      )
    end
  end

  task inspections: :environment do
    fuel_levels = %w[reserve low quarter medium high full]
    250.times do
      Workshop::Inspection.create(
        car: Faker::Vehicle.make_and_model,
        mechanic_name: Faker::Name.name,
        date: Faker::Date.between(5.years.ago, Date.today),
        mileage: Faker::Vehicle.mileage(50_000, 250_000),
        fuel_level: fuel_levels.sample,
        comment: Faker::Lorem.paragraph,
      )
    end
  end

end
