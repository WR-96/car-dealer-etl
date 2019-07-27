# frozen_string_literal: true

namespace :errors_sales do
  require 'faker'

  task all: %i[employees clients addresses cars test_drives bills payments deals]

  task employees: :environment do
    # Longitud de nombre mayor a 50 caracteres
    10.times do
      FactoryBot.create(:sales_employee, name: Faker::Lorem.paragraph_by_chars(55))
    end

    # Caracteres apellido invalido
    10.times do
      FactoryBot.create(:sales_employee, last_name: Faker::Base.regexify(/(\w|\d){10}/))
    end

    # Email invalido
    10.times do
      name = Faker::Name.first_name
      last_name = Faker::Name.last_name
      FactoryBot.create(:sales_employee, email: Faker::Internet.email("#{name} #{last_name}", '@'))
    end

    # Numero de telefono invalido
    10.times do
      FactoryBot.create(:sales_employee, phone: Faker::Base.regexify(/(\w|\d){10}/))
    end

    # Longtud de numer de telefono invalida
    10.times do
      FactoryBot.create(:sales_employee, phone: Faker::Base.numerify('3#########'))
    end
  end

  task addresses: :environment do
    # Longitud de nombre mayor a 50
    10.times do
      FactoryBot.create(:sales_address, client_name: Faker::Lorem.paragraph_by_chars(55))
    end

    # Nombre invalido
    10.times do
      FactoryBot.create(:sales_address, client_name: Faker::Base.regexify(/(\w|\d){10}/))
    end

    # Zip code invalido
    10.times do
      FactoryBot.create(:sales_address, zip_code: Faker::Base.regexify(/\w{5}/))
    end

    # Ciudad con longitud mayor a 100
    10.times do
      FactoryBot.create(:sales_address, city: Faker::Lorem.paragraph_by_chars(110))
    end

    # Pais con longitud mayor a 100
    10.times do
      FactoryBot.create(:sales_address, state: Faker::Lorem.paragraph_by_chars(110))
    end
  end

  task cars: :environment do
    # Longitud de 'modelo' mayor a 50
    10.times do
      FactoryBot.create(:sales_car, model: Faker::Lorem.paragraph_by_chars(55))
    end

    # Categoria invalida
    10.times do
      FactoryBot.create(:sales_car, category: Faker::Lorem.paragraph_by_chars(55))
    end

    # Invalid year
    10.times do
      FactoryBot.create(:sales_car, year: Faker::Base.regexify(/\w{4}/))
    end

    # Precio invalido
    10.times do
      FactoryBot.create(:sales_car, price: Faker::Base.regexify(/\w{5}/))
    end

    # Numero de serie invalido
    10.times do
      FactoryBot.create(:sales_car, serial_number: Faker::Vehicle.vin.downcase)
    end

    # Fecha de compra invalida
    10.times do
      FactoryBot.create(:sales_car, purchase_date: Faker::Base.regexify(%r{\w{2}/\w{2}/\w{4}}))
    end
  end

  task test_drives: :environment do
    # Nombre de cliente con longitud mayor a 55
    10.times do
      FactoryBot.create(:sales_test_drive, client_name: Faker::Lorem.paragraph_by_chars(55))
    end

    # Fecha invalida
    10.times do
      FactoryBot.create(:sales_test_drive, date: Faker::Base.regexify(%r{\w{2}/\w{2}/\w{4}}))
    end

    # Hora invalida
    10.times do
      FactoryBot.create(:sales_test_drive, hour: Faker::Base.regexify(/\w{2}:\w{2}/))
    end

    # Licencia invalida
    10.times do
      FactoryBot.create(:sales_test_drive, license_number: Faker::Base.regexify(/\w{8}/))
    end

    # Millas finales invalidas
    10.times do
      FactoryBot.create(:sales_test_drive, final_miles: 1)
    end
  end

  task deals: :environment do
    # Nombre de cliente invalido
    10.times do
      FactoryBot.create(:sales_deal, client_name: Faker::Lorem.paragraph_by_chars(55))
    end

    # Campo 'carro' invalido
    10.times do
      FactoryBot.create(:sales_deal, car: Faker::Lorem.paragraph_by_chars(55))
    end

    # Precio invalido
    10.times do
      FactoryBot.create(:sales_deal, price: Faker::Base.regexify(/\w{5}/))
    end

    # Fecha invalida
    10.times do
      FactoryBot.create(:sales_deal, date: Faker::Base.regexify(%r{\w{2}/\w{2}/\w{4}}))
    end

    # Dia de pago invalido
    10.times do
      FactoryBot.create(:sales_deal, payment_due_day: Faker::Base.regexify(/\w{2}/))
    end
  end

  task bills: :environment do
    # Nombre de cliente invalido
    10.times do
      FactoryBot.create(:sales_bill, client_name: Faker::Lorem.paragraph_by_chars(55))
    end

    # RFC invalido
    10.times do
      FactoryBot.create(:sales_bill, rfc: Faker::Base.regexify(/\w{13}/))
    end

    # Fecha invalida
    10.times do
      FactoryBot.create(:sales_bill, date: Faker::Base.regexify(%r{\w{2}/\w{2}/\w{4}}))
    end

    # total invalido
    10.times do
      FactoryBot.create(:sales_bill, total: Faker::Base.regexify(/\w{4}/))
    end

    # Impuesto en porcentaje invalido
    10.times do
      FactoryBot.create(:sales_bill, tax_percentage: Faker::Base.regexify(/\w{2}/))
    end
  end

  task payments: :environment do
    # Nombre de cliente invalido
    10.times do
      FactoryBot.create(:sales_payment, client_name: Faker::Lorem.paragraph_by_chars(55))
    end

    # Estatus invalido
    10.times do
      FactoryBot.create(:sales_payment, status: Faker::Lorem.word)
    end

    # Fecha limite de pago invalida
    10.times do
      due_date = Faker::Base.regexify(%r{\w{2}/\w{2}/\w{4}})
      payment_date = Faker::Date.between(5.years.ago, Date.today)
      FactoryBot.create(:sales_payment, due_date: due_date, payment_date: payment_date)
    end

    # Fecha de pago incorrecta
    10.times do
      FactoryBot.create(:sales_payment, payment_date: Faker::Base.regexify(%r{\w{2}/\w{2}/\w{4}}))
    end

    # Cantidad incorrecta
    10.times do
      FactoryBot.create(:sales_payment, amount: Faker::Base.regexify(/\w{4}/))
    end
  end

  task clients: :environment do
    # Nombre con longitund mayor a 50
    10.times do
      name = Faker::Lorem.paragraph_by_chars(55)
      email = Faker::Internet.free_email
      FactoryBot.create(:sales_client, name: name, email: email)
    end

    # Nombre invalido
    10.times do
      name = Faker::Base.regexify(/(\w|\d){10}/)
      email = Faker::Internet.free_email
      FactoryBot.create(:sales_client, name: name, email: email)
    end

    # Telefono invalido
    10.times do
      FactoryBot.create(:sales_client, phone: Faker::Base.regexify(/\w{10}/))
    end

    # Email invalido
    10.times do
      name = Faker::Name.name
      FactoryBot.create(:sales_client, email: Faker::Internet.email(name, '@'))
    end

    # RFC invalido
    10.times do
      FactoryBot.create(:sales_client, rfc: Faker::Base.regexify(/\w{13}/))
    end
  end
end
