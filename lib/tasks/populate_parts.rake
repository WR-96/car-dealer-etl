# frozen_string_literal: true

namespace :populate_parts do
  require 'faker'

  task all: %i[clients employees sales bills spare_parts providers sale_returns provider_returns
               supplier_orders requisitions]

  task clients: :environment do
    250.times do
      FactoryBot.create(:parts_client)
    end
  end

  task employees: :environment do
    250.times do
      FactoryBot.create(:parts_employee)
    end
  end

  task sales: :environment do
    250.times do
      FactoryBot.create(:parts_sale)
    end
  end

  task bills: :environment do
    250.times do
      FactoryBot.create(:parts_bill)
    end
  end

  task spare_parts: :environment do
    250.times do
      FactoryBot.create(:parts_spare_part)
    end
  end

  task providers: :environment do
    250.times do
      FactoryBot.create(:parts_provider)
    end
  end

  task sale_returns: :environment do
    250.times do
      FactoryBot.create(:parts_sale_return)
    end
  end

  task provider_returns: :environment do
    250.times do
      FactoryBot.create(:parts_provider_return)
    end
  end

  task supplier_orders: :environment do
    250.times do
      FactoryBot.create(:parts_supplier_order)
    end
  end

  task requisitions: :environment do
    250.times do
      FactoryBot.create(:parts_requisition)
    end
  end
end
