# frozen_string_literal: true

module Parts
  class Sale < ApplicationRecord
    attribute :date, :date
    validates :client_name, :employee_name, :date, :product, :price, :amount, 
              :total, presence: true
    validates :client_name, :employee_name, length: { maximum: 50 },
              format: { without: /\d/, message: 'only allow letters' }
    validates :date, date: true
    validates :product, length: { maximum: 250 }
    validates :price, :total, numericality: { greater_than: 0 }
    validates :amount, numericality: { only_integer: true, greater_than: 0 }
  end
end
