# frozen_string_literal: true

namespace :errors_parts do
  require 'faker'

  task all: %i[clients employees sales bills spare_parts providers sale_returns provider_returns
               supplier_orders requisitions]

  task clients: :environment do
    clients = []

    # Nombre con longitud mayor a 50
    10.times do
      email = Faker::Internet.email
      name = Faker::Lorem.paragraph_by_chars(55)
      clients.push(FactoryBot.build(:parts_client, name: name, email: email))
    end

    # Nombre invalido
    10.times do
      email = Faker::Internet.email
      name = Faker::Base.regexify(/(\w\d){5}/)
      clients.push(FactoryBot.build(:parts_client, name: name, email: email))
    end

    # Telefono invalido
    10.times do
      phone = Faker::Base.regexify(/\w{8}/)
      clients.push(FactoryBot.build(:parts_client, phone: phone))
    end

    # Correo invalido
    10.times do
      name = Faker::Name.name
      email = Faker::Internet.email(name, '@')
      clients.push(FactoryBot.build(:parts_client, name: name, email: email))
    end

    # RFC invalido
    10.times do
      rfc = Faker::Base.regexify(/\w{13}/)
      clients.push(FactoryBot.build(:parts_client, rfc: rfc))
    end

    clients.each { |client| client.save(validate: false) }
  end

  task employees: :environment do
    employees = []

    # Nombre con longitud mayor a 50
    10.times do
      name = Faker::Lorem.paragraph_by_chars(55)
      email = Faker::Internet.email
      employees.push(FactoryBot.build(:parts_employee, name: name, email: email))
    end

    # Nombre invalido
    10.times do
      name = Faker::Base.regexify(/(\w\d){5}/)
      email = Faker::Internet.email
      employees.push(FactoryBot.build(:parts_employee, name: name, email: email))
    end

    # Telefono invalido
    10.times do
      phone = Faker::Base.regexify(/\w{7}/)
      employees.push(FactoryBot.build(:parts_employee, phone: phone))
    end

    # Celular con longitud mayor a 10
    10.times do
      cellphone = Faker::Base.numerify('3###########')
      employees.push(FactoryBot.build(:parts_employee, cellphone: cellphone))
    end

    # Email incorrecto
    10.times do
      name = Faker::Name.name
      email = Faker::Internet.email(name, '@')
      employees.push(FactoryBot.build(:parts_employee, name: name, email: email))
    end

    employees.each { |employee| employee.save(validate: false) }
  end

  task sales: :environment do
    sales = []

    # Nombre invalido
    10.times do
      name = Faker::Base.regexify(/(\w\d){5}/)
      sales.push(FactoryBot.build(:parts_sale, client_name: name))
    end

    # Invalid date
    10.times do
      date = Faker::Base.regexify(/\w\w\/\w\w\/\w{4}/)
      sales.push(FactoryBot.build(:parts_sale, date: date))
    end

    # Producto con longitud mayor a 250
    10.times do
      product = Faker::Lorem.paragraph_by_chars(255)
      sales.push(FactoryBot.build(:parts_sale, product: product))
    end

    # Precio invalido
    10.times do
      price = Faker::Base.regexify(/\w{4}/)
      total = Faker::Commerce.price(300.0..5_000.0)  
      sales.push(FactoryBot.build(:parts_sale, price: price, total: total))
    end

    # Cantidad invalida
    10.times do
      amount = Faker::Base.regexify(/\w{2}/)
      total = Faker::Commerce.price(300.0..5_000.0)  
      sales.push(FactoryBot.build(:parts_sale, amount: amount, total: total))
    end

    sales.each { |sale| sale.save(validate: false) }
  end

  task bills: :environment do
    bills = []

    # Nombre de cliente con longitud mayor a 50
    10.times do
      name = Faker::Lorem.paragraph_by_chars(55)
      bills.push(FactoryBot.build(:parts_bill, client_name: name))
    end

    # RFC invaldio
    10.times do
      rfc = Faker::Base.regexify(/\w{13}/)
      bills.push(FactoryBot.build(:parts_bill, rfc: rfc))
    end

    # Producto con longitud mayor a 250
    10.times do
      product = Faker::Lorem.paragraph_by_chars(255)
      bills.push(FactoryBot.build(:parts_bill, product: product))
    end

    # cantidad invalida
    10.times do
      bills.push(FactoryBot.build(:parts_bill, amount: 0))
    end

    # precio invalido
    10.times do
      price = Faker::Base.regexify(/\w{4}/)
      sub_total = Faker::Commerce.price(300.0..5_000.0)
      bills.push(FactoryBot.build(:parts_bill, price: price, sub_total: sub_total))
    end

    bills.each { |bill| bill.save(validate: false) }
  end

  task spare_parts: :environment do
    spare_parts = []

    # Descripcion con longitud mayor a 250
    10.times do
      description = Faker::Lorem.paragraph_by_chars(255)
      spare_parts.push(FactoryBot.build(:parts_spare_part, description: description))
    end

    # Modelo de carro con logitud mayor a 50
    10.times do
      car_model = Faker::Lorem.paragraph_by_chars(55)
      spare_parts.push(FactoryBot.build(:parts_spare_part, car_model: car_model))
    end

    # Fabricante de carro con longitud mayor a 55
    10.times do
      car_maker = Faker::Lorem.paragraph_by_chars(55)
      car_model = Faker::Vehicle.model
      spare_parts.push(FactoryBot.build(:parts_spare_part, car_maker: car_maker, 
                                        car_model: car_model))
    end

    # Precio invalido
    10.times do
      price = Faker::Base.regexify(/\w{4}/)
      spare_parts.push(FactoryBot.build(:parts_spare_part, price: price))
    end

    # Stock invalido
    10.times do
      stock = Random.rand(10..100) * -1
      spare_parts.push(FactoryBot.build(:parts_spare_part, stock: stock))
    end

    spare_parts.each { |spare_part| spare_part.save(validate: false) }
  end

  task providers: :environment do
    providers = []

    # Tradename con longitud mayor a 150
    10.times do
      tradename = Faker::Lorem.paragraph_by_chars(155)
      providers.push(FactoryBot.build(:parts_provider, tradename: tradename))
    end

    # telefono invalido
    10.times do
      phone = Faker::Base.regexify(/\w{7}/)
      providers.push(FactoryBot.build(:parts_provider, phone: phone))
    end

    # Email invalido
    10.times do
      name = Faker::Name.name
      email = Faker::Internet.email(name, '@')
      providers.push(FactoryBot.build(:parts_provider, tradename: name, email: email))
    end

    # Pieca con longitud mayor a 250
    10.times do
      piece = Faker::Lorem.paragraph_by_chars(255)
      providers.push(FactoryBot.build(:parts_provider, piece: piece))
    end

    # Precio invalido
    10.times do
      price = (Random.rand(300.0..5_000.0) * -1).round(2)
      providers.push(FactoryBot.build(:parts_provider, price: price))
    end

    providers.each { |provider| provider.save(validate: false) }
  end

  task sale_returns: :environment do
    sale_returns = []

    # Nombre con longitud mayor a 50
    10.times do
      name = Faker::Lorem.paragraph_by_chars(55)
      sale_returns.push(FactoryBot.build(:parts_sale_return, client_name: name))
    end

    # Fecha invalida
    10.times do
      date = Faker::Base.regexify(/\w\w\/\w\w\/\w{4}/)
      sale_returns.push(FactoryBot.build(:parts_sale_return, date: date))
    end

    # Articulo con longitud mayor a 250
    10.times do
      article = Faker::Lorem.paragraph_by_chars(255)
      sale_returns.push(FactoryBot.build(:parts_sale_return, article: article))
    end

    # Refound invalido
    10.times do
      refound = Faker::Base.regexify(/\w{4}/)
      sale_returns.push(FactoryBot.build(:parts_sale_return, refound: refound))
    end

    # Comentario con logitud mayor a 250
    10.times do
      comment = Faker::Lorem.paragraph_by_chars(255)
      sale_returns.push(FactoryBot.build(:parts_sale_return, comment: comment))
    end

    sale_returns.each { |sale_return| sale_return.save(validate: false) }
  end

  task provider_returns: :environment do
    provider_returns = []
    # Nombre con longitud mayor a 50
    10.times do
      name = Faker::Lorem.paragraph_by_chars(55)
      provider_returns.push(FactoryBot.build(:parts_provider_return, provider_name: name))
    end

    # Fecha invalida
    10.times do
      date = Faker::Base.regexify(/\w\w\/\w\w\/\w{4}/)
      provider_returns.push(FactoryBot.build(:parts_provider_return, date: date))
    end

    # Articulo con longitud mayor a 250
    10.times do
      article = Faker::Lorem.paragraph_by_chars(255)
      provider_returns.push(FactoryBot.build(:parts_provider_return, article: article))
    end

    # Refound invalido
    10.times do
      refound = Faker::Base.regexify(/\w{4}/)
      provider_returns.push(FactoryBot.build(:parts_provider_return, refound: refound))
    end

    # Comentario con logitud mayor a 250
    10.times do
      comment = Faker::Lorem.paragraph_by_chars(255)
      provider_returns.push(FactoryBot.build(:parts_provider_return, comment: comment))
    end

    provider_returns.each { |provider_return| provider_return.save(validate: false) }
  end

  task supplier_orders: :environment do
    supplier_orders = []

    # Nombre con longitud mayor a 50
    10.times do
      name = Faker::Lorem.paragraph_by_chars(55)
      supplier_orders.push(FactoryBot.build(:parts_supplier_order, employee_name: name))
    end

    # Fecha invalida
    10.times do
      date = Faker::Base.regexify(/\w\w\/\w\w\/\w{4}/)
      supplier_orders.push(FactoryBot.build(:parts_supplier_order, delivery_date: date))
    end

    # Status invalido
    10.times do
      status = Faker::Lorem.word
      supplier_orders.push(FactoryBot.build(:parts_supplier_order, status: status))
    end

    # Articulo con longitud mayor a 250
    10.times do
      article = Faker::Lorem.paragraph_by_chars(255)
      supplier_orders.push(FactoryBot.build(:parts_supplier_order, article: article))
    end

    # Total invalido
    10.times do
      total = Faker::Base.regexify(/\w{4}/)
      supplier_orders.push(FactoryBot.build(:parts_supplier_order, total: total))
    end

    supplier_orders.each { |supplier_order| supplier_order.save(validate: false) }
  end

  task requisitions: :environment do
    requisitions = []

    # Nombre invalido
    10.times do
      name = Faker::Base.regexify(/(\w\d){5}/)
      requisitions.push(FactoryBot.build(:parts_requisition, employee_name: name))
    end

    # Fecha invalida
    10.times do
      date = Faker::Base.regexify(/\w\w\/\w\w\/\w{4}/)
      requisitions.push(FactoryBot.build(:parts_requisition, delivery_date: date))
    end

    # Status invalido
    10.times do
      status = Faker::Lorem.word
      requisitions.push(FactoryBot.build(:parts_requisition, status: status))
    end

    # Articulo con longitud mayor a 250
    10.times do
      article = Faker::Lorem.paragraph_by_chars(255)
      requisitions.push(FactoryBot.build(:parts_requisition, article: article))
    end

    # Cantidad invalida
    10.times do
      amount = Faker::Base.regexify(/\w{3}/)
      requisitions.push(FactoryBot.build(:parts_requisition, amount: amount))
    end

    requisitions.each { |requisition| requisition.save(validate: false) }
  end
end
