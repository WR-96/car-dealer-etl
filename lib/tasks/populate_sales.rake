# frozen_string_literal: true

namespace :populate_sales do
  require 'faker'

  task all:  %i[employees clients addresses cars test_drives bills payments deals]

  task employees: :environment do

    250.times do
      FactoryBot.create(:sales_employee)
    end
  end

  task clients: :environment do
    250.times do
      FactoryBot.create(:sales_client)
    end
  end

  task addresses: :environment do
    250.times do
      FactoryBot.create(:sales_address)
    end
  end

  task cars: :environment do
    250.times do
      FactoryBot.create(:sales_car)
    end
  end

  task test_drives: :environment do
    250.times do
      FactoryBot.create(:sales_test_drive)
    end
  end

  task deals: :environment do
    250.times do
      FactoryBot.create(:sales_deal)
    end
  end

  task bills: :environment do
    250.times do
      FactoryBot.create(:sales_bill)
    end
  end

  task payments: :environment do
    250.times do
      FactoryBot.create(:sales_payment)
    end
  end

end
