# frozen_string_literal: true

module Workshop
  class Car < ApplicationRecord
    validates :client_name, :maker, :car, :color, :year, :license_plate,
              :serial_number, presence: true
    validates :client_name, length: { maximum: 50 }, format: { without: /\d/,
                                                               message: 'only allow letters' }
    validates :car, :maker, :color, length: { maximum: 50 }
    validates :year, numericality: { only_integer: true, greater_than_or_equal_to: 2004,
                                      less_than_or_equal_to: 2019 }
    validates :license_plate, format: { with: /[A-Z]{3}-\d{4}/,
                                        message: 'does not have the correct format' }
    validates :serial_number, format: { with: /\A[A-Z0-9]+\z/,
                                        message: 'does not have the correct format' }
  end
end
