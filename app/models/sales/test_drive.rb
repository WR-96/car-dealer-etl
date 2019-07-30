# frozen_string_literal: true

module Sales
  class TestDrive < ApplicationRecord
    attribute :date, :date
    attribute :inital_miles, :integer
    validates :client_name, :agent_name, :car, :date, :hour, :license_number, :inital_miles,
              :final_miles, presence: true
    validates :client_name, :agent_name, :car, length: { maximum: 50 }
    validates :client_name, :agent_name, length: { maximum: 50 },
                                         format: { without: /\d/, message: 'only allow letters' }
    validates :date, date: true
    validates :license_number, numericality: { only_integer: true }, length: { is: 8 }
    validates :inital_miles, numericality: { only_integer: true, greater_than: 0}
    validates :final_miles, numericality: { only_integer: true, greater_than: :inital_miles }
    validates :hour, format: { with: /\A(2[0-3]|[01]?\d):[0-5]\d\z/,
                               message: 'needs to be in 24hr format "HH:MM"' }
  end
end
