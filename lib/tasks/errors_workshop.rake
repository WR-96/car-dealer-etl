# frozen_string_literal: true

namespace :errors_workshop do
  require 'faker'

  task all: %i[clients cars bookings pieces mechanics repairs bills inspections]

  task clients: :environment do
    clients = []

    # Nombre con longitud mayor a 50
    10.times do
      name = Faker::Lorem.paragraph_by_chars(55)
      email = Faker::Internet.email
      clients.push(FactoryBot.build(:workshop_client, name: name, email: email))
    end

    # Nombre invalido
    10.times do
      name = Faker::Base.regexify(/(\w|\d){5}/)
      email = Faker::Internet.email
      clients.push(FactoryBot.build(:workshop_client, name: name, email: email))
    end

    # Telefono invalido
    10.times do
      phone = Faker::Base.regexify(/\w{7}/)
      clients.push(FactoryBot.build(:workshop_client, phone: phone))
    end

    # Correo invalido
    10.times do
      name = Faker::Name.name
      email = Faker::Internet.email(name, '@')
      clients.push(FactoryBot.build(:workshop_client, name: name, email: email))
    end

    # RFC invalido
    10.times do
      rfc = Faker::Base.regexify(/\w{13}/)
      clients.push(FactoryBot.build(:workshop_client, rfc: rfc))
    end

    clients.each { |client| client.save(validate: false) }
  end

  task cars: :environment do
    cars = []

    # Nombre de cliente invalido
    10.times do
      name = Faker::Base.regexify(/(\w|\d){5}/)
      cars.push(FactoryBot.build(:workshop_car, client_name: name))
    end

    # Carro con longitud mayor a 50
    10.times do
      car = Faker::Lorem.paragraph_by_chars(55)
      cars.push(FactoryBot.build(:workshop_car, car: car))
    end

    # Color invalido
    10.times do
      color = Faker::Base.regexify(/(\w|\d){5}/)
      cars.push(FactoryBot.build(:workshop_car, color: color))
    end

    # Annio invalido
    10.times do
      year = Faker::Base.regexify(/\w{4}/)
      cars.push(FactoryBot.build(:workshop_car, year: year))
    end

    # Placa invalida
    10.times do
      license_plate = Faker::Base.regexify(/\w{8}/)
      cars.push(FactoryBot.build(:workshop_car, license_plate: license_plate))
    end

    cars.each { |car| car.save(validate: false) }
  end

  task bookings: :environment do
    bookings = []

    # Nombre de mecanico con longitud mayor a 50
    10.times do
      mechanic_name = Faker::Lorem.paragraph_by_chars(55)
      bookings.push(FactoryBot.build(:workshop_booking, mechanic_name: mechanic_name))
    end

    # Nombre de cliente invalido
    10.times do
      client_name = Faker::Lorem.paragraph_by_chars(55)
      bookings.push(FactoryBot.build(:workshop_booking, client_name: client_name))
    end

    # Carro con longitud mayor a 50
    10.times do
      car = Faker::Lorem.paragraph_by_chars(55)
      bookings.push(FactoryBot.build(:workshop_booking, car: car))
    end

    # Hora invalida
    10.times do
      hour = Faker::Base.regexify(/\w\w:\w\w/)
      bookings.push(FactoryBot.build(:workshop_booking, hour: hour))
    end

    # Descripcion con longitud mayor a 250
    10.times do
      description = Faker::Lorem.paragraph_by_chars(255)
      bookings.push(FactoryBot.build(:workshop_booking, description: description))
    end

    bookings.each { |booking| booking.save(validate: false) }
  end

  task pieces: :environment do
    pieces = []

    # Carro con longitud mayor a 50
    10.times do
      car = Faker::Lorem.paragraph_by_chars(55)
      pieces.push(FactoryBot.build(:workshop_piece, car: car))
    end

    # Fabricante con longitud mayor a 50
    10.times do
      maker = Faker::Lorem.paragraph_by_chars(55)
      car = Faker::Vehicle.model
      pieces.push(FactoryBot.build(:workshop_piece, car: car, maker: maker))
    end

    # Descripcion con longitud mayor a 250
    10.times do
      description = Faker::Lorem.paragraph_by_chars(255)
      pieces.push(FactoryBot.build(:workshop_piece, description: description))
    end

    # Precion invalido
    10.times do
      price = Faker::Base.regexify(/\w{5}/)
      pieces.push(FactoryBot.build(:workshop_piece, price: price))
    end

    # Precion negativo
    10.times do
      price = Faker::Commerce.price(100_000..500_000) * -1
      pieces.push(FactoryBot.build(:workshop_piece, price: price))
    end

    pieces.each { |piece| piece.save(validate: false) }
  end

  task mechanics: :environment do
    mechanics = []

    # Nombre con longitud mayor a 50
    10.times do
      name = Faker::Lorem.paragraph_by_chars(55)
      email = Faker::Internet.email
      mechanics.push(FactoryBot.build(:workshop_mechanic, name: name, email: email))
    end

    # Nombre invalido
    10.times do
      name = Faker::Base.regexify(/(\w|\d){5}/)
      email = Faker::Internet.email
      mechanics.push(FactoryBot.build(:workshop_mechanic, name: name, email: email))
    end

    # Telefono invalido
    10.times do
      phone = Faker::Base.regexify(/\w{7}/)
      mechanics.push(FactoryBot.build(:workshop_mechanic, phone: phone))
    end

    # Correo invalido
    10.times do
      name = Faker::Name.name
      email = Faker::Internet.email(name, '@')
      mechanics.push(FactoryBot.build(:workshop_mechanic, name: name, email: email))
    end

    # Celular con longitud mayor a 10
    10.times do
      cellphone = Faker::Base.numerify('312########')
      mechanics.push(FactoryBot.build(:workshop_mechanic, cellphone: cellphone))
    end

    mechanics.each { |mechanic| mechanic.save(validate: false) }
  end

  task repairs: :environment do
    repairs = []

    # Fecha invalida
    10.times do
      date = Faker::Base.regexify(/\w\w\/\w\w\/\w{4}/)
      repairs.push(FactoryBot.build(:workshop_repair, date: date))
    end

    # Nombre de mecanico invalido
    10.times do
      name = Faker::Base.regexify(/(\w|\d){5}/)
      repairs.push(FactoryBot.build(:workshop_repair, mechanic_name: name))
    end

    # Nombre de mecanico con longitud mayor a 50
    10.times do
      name = Faker::Lorem.paragraph_by_chars(55)
      repairs.push(FactoryBot.build(:workshop_repair, mechanic_name: name))
    end

    # Carro con longitud mayor a 50
    10.times do
      car = Faker::Lorem.paragraph_by_chars(55)
      repairs.push(FactoryBot.build(:workshop_repair, car: car))
    end

    # Total invalido
    10.times do
      total = Faker::Commerce.price(500..5_000) * -1
      repairs.push(FactoryBot.build(:workshop_repair, total: total))
    end

    repairs.each { |repair| repair.save(validate: false) }
  end

  task bills: :environment do
    bills = []

    # Fecha invalida
    10.times do
      date = Faker::Base.regexify(/\w\w\/\w\w\/\w{4}/)
      bills.push(FactoryBot.build(:workshop_bill, date: date))
    end

    # Nombre de cliente invalido 
    10.times do
      name = Faker::Lorem.paragraph_by_chars(55)
      bills.push(FactoryBot.build(:workshop_bill, client_name: name))
    end

    # RFC invalido
    10.times do
      rfc = Faker::Base.regexify(/\w{13}/)
      bills.push(FactoryBot.build(:workshop_bill, rfc: rfc))
    end

    # Servicio con longitud mayor a 250
    10.times do
      service = Faker::Lorem.paragraph_by_chars(255)
      bills.push(FactoryBot.build(:workshop_bill, service: service))
    end

    # Subtotal invalido
    10.times do
      sub_total = Faker::Commerce.price(500..5_000) * -1
      bills.push(FactoryBot.build(:workshop_bill, sub_total: sub_total))
    end

    bills.each { |bill| bill.save(validate: false) }
  end

  task inspections: :environment do
    inspections = []

    # Carro con longitud mayor a 50
    10.times do
      car = Faker::Lorem.paragraph_by_chars(55)
      inspections.push(FactoryBot.build(:workshop_inspection, car: car))
    end

    # Nombre de mecanico invalido
    10.times do
      name = Faker::Base.regexify(/(\w|\d){5}/)
      inspections.push(FactoryBot.build(:workshop_inspection, mechanic_name: name))
    end

    # Millage invalido
    10.times do
      mileage = Faker::Vehicle.mileage * -1  
      inspections.push(FactoryBot.build(:workshop_inspection, mileage: mileage))
    end

    # Nivel de tanque invalido
    10.times do
      fuel_level = Faker::Lorem.word
      inspections.push(FactoryBot.build(:workshop_inspection, fuel_level: fuel_level))
    end

    # Comentario con longitud mayor a 250
    10.times do
      comment = Faker::Lorem.paragraph_by_chars(255)
      inspections.push(FactoryBot.build(:workshop_inspection, comment: comment))
    end

    inspections.each { |inspection| inspection.save(validate: false) }
  end

end
