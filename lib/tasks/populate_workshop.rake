# frozen_string_literal: true

namespace :populate_workshop do
  require 'faker'

  task all: %i[clients cars bookings pieces mechanics repairs bills inspections]

  task clients: :environment do
    250.times do
      FactoryBot.create(:workshop_client)
    end
  end

  task cars: :environment do
    250.times do
      FactoryBot.create(:workshop_car)
    end
  end

  task bookings: :environment do
    250.times do
      FactoryBot.create(:workshop_booking)
    end
  end

  task pieces: :environment do
    250.times do
      FactoryBot.create(:workshop_piece)
    end
  end

  task mechanics: :environment do
    250.times do
      FactoryBot.create(:workshop_mechanic)
    end
  end

  task repairs: :environment do
    250.times do
      FactoryBot.create(:workshop_repair)
    end
  end

  task bills: :environment do
    250.times do
      FactoryBot.create(:workshop_bill)
    end
  end

  task inspections: :environment do
    250.times do
      FactoryBot.create(:workshop_inspection)
    end
  end
end
