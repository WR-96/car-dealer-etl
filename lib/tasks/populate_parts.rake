# frozen_string_literal: true

namespace :populate_parts do
  require 'faker'

  task all: %i[clients employees sales bills spare_parts providers sale_returns provider_returns
               supplier_orders requisitions]

  task clients: :environment do
    250.times do
      name = Faker::Name.name
      Parts::Client.create(
        name: name,
        phone: Faker::Base.numerify('3######'),
        cellphone: Faker::Base.numerify('312#####a##'),
        email: Faker::Internet.free_email(name),
        rfc: Faker::Base.regexify(/[A-Z]{4}\d\d(0[1-9]|1[012])([0-2]\d|30|31)([A-Z]|\d){3}/)
      )
    end
  end

  task employees: :environment do
    250.times do
      name = Faker::Name.name
      Parts::Employee.create(
        name: name,
        phone: Faker::Base.numerify('3######'),
        cellphone: Faker::Base.numerify('312#######'),
        email: Faker::Internet.free_email(name),
      )
    end
  end

  task sales: :environment do
    250.times do
      price = Faker::Commerce.price(300.0..5_000.0)
      amount = Faker::Number.within(1..10)
      total = price * amount
      Parts::Sale.create(
        client_name: Faker::Name.name,
        employee_name: Faker::Name.name,
        date: Faker::Date.between(5.years.ago, Date.today),
        product: Faker::Vehicle.standard_specs.sample,
        amount: amount,
        price: price,
        total: total.round(2)
      )      
    end
  end

  task bills: :environment do
    250.times do
      price = Faker::Commerce.price(300.0..5_000.0)
      amount = Faker::Number.within(1..10)
      sub_total = price * amount
      tax_percentage = 15
      tax_amount = (sub_total * tax_percentage) / 100
      total = sub_total.round(2) + tax_amount.round(2)

      Parts::Bill.create(
        client_name: Faker::Name.name,
        rfc: Faker::Base.regexify(/[A-Z]{4}\d\d(0[1-9]|1[012])([0-2]\d|30|31)([A-Z]|\d){3}/),
        date: Faker::Date.between(5.years.ago, Date.today),
        product: Faker::Vehicle.standard_specs.sample,
        amount: amount,
        price: price,
        sub_total: sub_total.round(2),
        tax_percentage: tax_percentage,
        tax_amount: tax_amount.round(2),
        total: total.round(2)
      )      
    end
  end

  task spare_parts: :environment do
    250.times do
      maker = Faker::Vehicle.make
      Parts::SparePart.create(
        description: Faker::Vehicle.standard_specs.sample,
        car_model: Faker::Vehicle.model(maker),
        car_maker: maker,
        price: Faker::Commerce.price(300.0..5_000.0),
        stock: Faker::Number.within(10..100),
        reorder: Faker::Number.within(5..20)
      )
    end
  end

  task providers: :environment do
    250.times do
      Parts::Provider.create(
        tradename: Faker::Company.name,
        phone: Faker::Base.numerify('3######'),
        cellphone: Faker::Base.numerify('312#####a##'),
        email: Faker::Internet.free_email,
        car_maker: Faker::Vehicle.make,
        piece: Faker::Vehicle.standard_specs.sample,
        price: Faker::Commerce.price(300.0..5_000.0)
      )
    end
  end

  task sale_returns: :environment do
    250.times do
      Parts::SaleReturn.create(
        client_name: Faker::Name.name,
        date: Faker::Date.between(5.years.ago, Date.today),
        article: Faker::Vehicle.standard_specs.sample,
        refound: Faker::Commerce.price(300.0..5_000.0),
        comment: Faker::Lorem.sentence
      )
    end
  end

  task provider_returns: :environment do
    250.times do
      Parts::ProviderReturn.create(
        provider_name: Faker::Company.name,
        date: Faker::Date.between(5.years.ago, Date.today),
        article: Faker::Vehicle.standard_specs.sample,
        refound: Faker::Commerce.price(300.0..5_000.0),
        comment: Faker::Lorem.sentence
      )
    end
  end

  task supplier_orders: :environment do
    statuses = %w[shipped pending delivered canceled]
    250.times do
      amount = Faker::Number.within(100..1_000)
      price = Faker::Commerce.price(300.0..5_000.0)
      total = amount * price
      date = Faker::Date.between(5.year.ago, Date.today)
      Parts::SupplierOrder.create(
        employee_name: Faker::Name.name,
        date: date,
        supplier_tradename: Faker::Company.name,
        status: statuses.sample,
        delivery_date: Faker::Date.between(date + 1.weeks, date + 3.weeks),
        article: Faker::Vehicle.standard_specs.sample,
        price: price,
        amount: amount,
        total: total.round(2)
      )
    end
  end

  task requisitions: :environment do
    statuses = %w[shipped pending delivered canceled]
    250.times do
      date = Faker::Date.between(5.year.ago, Date.today)
      Parts::Requisition.create(
        employee_name: Faker::Name.name,
        date: date,
        status: statuses.sample,
        delivery_date: Faker::Date.between(date + 1.weeks, date + 3.weeks),
        article: Faker::Vehicle.standard_specs.sample,
        amount: Faker::Number.within(10..100),
      )
    end
  end
end
