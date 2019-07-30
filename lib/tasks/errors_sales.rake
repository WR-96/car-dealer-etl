# frozen_string_literal: true

namespace :errors_sales do
  require 'faker'
  task all: %i[employees clients addresses cars test_drives bills payments deals]

  task employees: :environment do
    employees = []

    # Longitud de nombre mayor a 50 caracteres
    10.times do
      name = Faker::Lorem.paragraph_by_chars(55)
      employees.push(FactoryBot.build(:sales_employee, name: name))
    end

    # Caracteres apellido invalido
    10.times do
      last_name = Faker::Base.regexify(/(\w|\d){10}/)
      employees.push(FactoryBot.build(:sales_employee, last_name: last_name))
    end

    # Email invalido
    10.times do
      name = Faker::Name.first_name
      last_name = Faker::Name.last_name
      email = Faker::Internet.email("#{name} #{last_name}", '@')
      employees.push(FactoryBot.build(:sales_employee, email: email))
    end

    # Numero de telefono invalido
    10.times do
      phone = Faker::Base.regexify(/(\w|\d){10}/)
      employees.push(FactoryBot.build(:sales_employee, phone: phone))
    end

    # Longtud de numer de telefono invalida
    10.times do
      phone = Faker::Base.numerify('3#########')
      employees.push(FactoryBot.build(:sales_employee, phone: phone))
    end

    employees.each { |employee| employee.save(validate: false)}

  end

  task addresses: :environment do
    addresses = []

    # Longitud de nombre mayor a 50
    10.times do
      client_name = Faker::Lorem.paragraph_by_chars(55)
      addresses.push(FactoryBot.build(:sales_address, client_name: client_name))
    end

    # Nombre invalido
    10.times do
      client_name = Faker::Base.regexify(/(\w|\d){10}/)
      addresses.push(FactoryBot.build(:sales_address, client_name: client_name))
    end

    # Zip code invalido
    10.times do
      zip_code = Faker::Base.regexify(/\w{5}/)
      addresses.push(FactoryBot.build(:sales_address, zip_code: zip_code))
    end

    # Ciudad con longitud mayor a 100
    10.times do
      city = Faker::Lorem.paragraph_by_chars(110)
      addresses.push(FactoryBot.build(:sales_address, city: city))
    end

    # Pais con longitud mayor a 100
    10.times do
      state = Faker::Lorem.paragraph_by_chars(110)
      addresses.push(FactoryBot.build(:sales_address, state: state))
    end

    addresses.each { |address| address.save(validate: false) }
  end

  task cars: :environment do
    cars = []

    # Longitud de 'modelo' mayor a 50
    10.times do
      model = Faker::Lorem.paragraph_by_chars(55)
      cars.push(FactoryBot.build(:sales_car, model: model))
    end

    # Categoria invalida
    10.times do
      category = Faker::Lorem.paragraph_by_chars(55)
      cars.push(FactoryBot.build(:sales_car, category: category))
    end

    # Invalid year
    10.times do
      year = Faker::Base.regexify(/\w{4}/)
      cars.push(FactoryBot.build(:sales_car, year: year))
    end

    # Precio invalido
    10.times do
      price = Faker::Base.regexify(/\w{5}/)
      cars.push(FactoryBot.build(:sales_car, price: price))
    end

    # Numero de serie invalido
    10.times do
      serial_number = Faker::Vehicle.vin.downcase
      cars.push(FactoryBot.build(:sales_car, serial_number: serial_number))
    end

    # Fecha de compra invalida
    10.times do
      purchase_date = Faker::Base.regexify(%r{\w{2}/\w{2}/\w{4}})
      cars.push(FactoryBot.build(:sales_car, purchase_date: purchase_date))
    end

    cars.each { |car| car.save(validate: false) }
  end

  task test_drives: :environment do
    test_drives = []

    # Nombre de cliente con longitud mayor a 55
    10.times do
      client_name = Faker::Lorem.paragraph_by_chars(55)
      test_drives.push(FactoryBot.build(:sales_test_drive, client_name: client_name))
    end

    # Fecha invalida
    10.times do
      date = Faker::Base.regexify(%r{\w{2}/\w{2}/\w{4}})
      test_drives.push(FactoryBot.build(:sales_test_drive, date: date))
    end

    # Hora invalida
    10.times do
      hour = Faker::Base.regexify(/\w{2}:\w{2}/)
      test_drives.push(FactoryBot.build(:sales_test_drive, hour: hour))
    end

    # Licencia invalida
    10.times do
      license_number = Faker::Base.regexify(/\w{8}/)
      test_drives.push(FactoryBot.build(:sales_test_drive, license_number: license_number))
    end

    # Millas finales invalidas
    10.times do
      final_miles = 1
      test_drives.push(FactoryBot.build(:sales_test_drive, final_miles: final_miles))
    end

    test_drives.each { |test_drive| test_drive.save(validate: false) }
  end

  task deals: :environment do
    deals =  []
    
    # Nombre de cliente invalido
    10.times do
      client_name = Faker::Lorem.paragraph_by_chars(55)
      deals.push(FactoryBot.build(:sales_deal, client_name: client_name))
    end

    # Campo 'carro' invalido
    10.times do
      car = Faker::Lorem.paragraph_by_chars(55)
      deals.push(FactoryBot.build(:sales_deal, car: car))
    end

    # Precio invalido
    10.times do
      price = Faker::Base.regexify(/\w{5}/)
      deals.push(FactoryBot.build(:sales_deal, price: price))
    end

    # Fecha invalida
    10.times do
      date = Faker::Base.regexify(%r{\w{2}/\w{2}/\w{4}})
      deals.push(FactoryBot.build(:sales_deal, date: date))
    end

    # Dia de pago invalido
    10.times do
      payment_due_day = Faker::Base.regexify(/\w{2}/)
      deals.push(FactoryBot.build(:sales_deal, payment_due_day: payment_due_day))
    end

    deals.each { |deal| deal.save(validate: false) }
  end

  task bills: :environment do
    bills = []

    # Nombre de cliente invalido
    10.times do
      client_name = Faker::Lorem.paragraph_by_chars(55)
      bills.push(FactoryBot.build(:sales_bill, client_name: client_name))
    end

    # RFC invalido
    10.times do
      rfc = Faker::Base.regexify(/\w{13}/)
      bills.push(FactoryBot.build(:sales_bill, rfc: rfc))
    end

    # Fecha invalida
    10.times do
      date = Faker::Base.regexify(%r{\w{2}/\w{2}/\w{4}})
      bills.push(FactoryBot.build(:sales_bill, date: date))
    end

    # total invalido
    10.times do
      total = Faker::Base.regexify(/\w{4}/)
      bills.push(FactoryBot.build(:sales_bill, total: total))
    end

    # Impuesto en porcentaje invalido
    10.times do
      tax_percentage = Faker::Base.regexify(/\w{2}/)
      bills.push(FactoryBot.build(:sales_bill, tax_percentage: tax_percentage))
    end

    bills.each { |bill| bill.save(validte: false) }
  end

  task payments: :environment do
    payments = []

    # Nombre de cliente invalido
    10.times do
      client_name = Faker::Lorem.paragraph_by_chars(55)
      payments.push(FactoryBot.build(:sales_payment, client_name: client_name))
    end

    # Estatus invalido
    10.times do
      status = Faker::Lorem.word
      payments.push(FactoryBot.build(:sales_payment, status: status))
    end

    # Fecha limite de pago invalida
    10.times do
      due_date = Faker::Base.regexify(%r{\w{2}/\w{2}/\w{4}})
      payment_date = Faker::Date.between(5.years.ago, Date.today)
      payments.push(FactoryBot.build(:sales_payment, due_date: due_date, payment_date: payment_date))
    end

    # Fecha de pago incorrecta
    10.times do
      payment_date = Faker::Base.regexify(%r{\w{2}/\w{2}/\w{4}})
      payments.push(FactoryBot.build(:sales_payment, payment_date: payment_date))
    end

    # Cantidad incorrecta
    10.times do
      amount = Faker::Base.regexify(/\w{4}/)
      payments.push(FactoryBot.build(:sales_payment, amount: amount))
    end

    payments.each { |payment| payment.save(validate: false) }
  end

  task clients: :environment do
    clients = []

    # Nombre con longitund mayor a 50
    10.times do
      name = Faker::Lorem.paragraph_by_chars(55)
      email = Faker::Internet.free_email
      clients.push(FactoryBot.build(:sales_client, name: name, email: email))
    end

    # Nombre invalido
    10.times do
      name = Faker::Base.regexify(/(\w|\d){10}/)
      email = Faker::Internet.free_email
      clients.push(FactoryBot.build(:sales_client, name: name, email: email))
    end

    # Telefono invalido
    10.times do
      clients.push(FactoryBot.build(:sales_client, phone: Faker::Base.regexify(/\w{10}/)))
    end

    # Email invalido
    10.times do
      name = Faker::Name.name
      clients.push(FactoryBot.build(:sales_client, email: Faker::Internet.email(name, '@')))
    end

    # RFC invalido
    10.times do
      clients.push(FactoryBot.build(:sales_client, rfc: Faker::Base.regexify(/\w{13}/)))
    end

    clients.each { |client| client.save(validate: false) }
  end
end
