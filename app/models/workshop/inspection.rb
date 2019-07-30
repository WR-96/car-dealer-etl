# frozen_string_literal: true

module Workshop
  class Inspection < ApplicationRecord
    attribute :date, :date
    validates :car, :mechanic_name, :date, :mileage, :fuel_level, :comment, presence: true
    validates :car, :mechanic_name, length: { maximum: 50 }
    validates :mechanic_name, format: { without: /\d/, message: 'only allow letters' }
    validates :mileage, numericality: { only_integer: true, greater_than: 0 }
    validates :date, date: true
    validates :fuel_level, inclusion: { in: %w[reserve low quarter medium high full],
                                        message: "%{value} is not a valid fuel level" }
    validates :comment, length: { maximum: 250 }
  end
end
