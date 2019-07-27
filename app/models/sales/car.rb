# frozen_string_literal: true

module Sales
  class Car < ApplicationRecord
    attribute :purchase_date, :date
    validates :model, :category, :maker, :color, :year, :price, :miles, :serial_number,
              :purchase_date, presence: true
    validates :model, :category, :maker, :color, length: { maximum: 50 }
    validates :serial_number, format: { with: /\A([A-Z]|\d)*\z/,
                                        message: 'only upercase letter and numbers' }
    validates :year, numericality: { greater_than: 2003, less_than: 2020 }
    validates :price, :miles, numericality: { greater_than: 0 }
    validates :purchase_date, date: true
  end
end
