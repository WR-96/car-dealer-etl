# frozen_string_literal: true

module Parts
  class Bill < ApplicationRecord
    attribute :date, :date
    validates :client_name, :rfc, :date, :product, :price, :amount, :sub_total, :tax_percentage, 
              :tax_amount, :total, presence: true
    validates :client_name, length: { maximum: 50 }, format: { without: /\d/,
                                                               message: 'only allow letters' }
    validates :product, length: { maximum: 250 }
    validates :rfc, format: { with: /[A-Z]{4}\d\d(0[1-9]|1[012])([0-2]\d|30|31)([A-Z]|\d){3}/ }
    validates :date, date: true
    validates :amount, :tax_percentage, numericality: { only_integer: true, greater_than: 0 }
    validates :price, :sub_total, :tax_amount, :total, numericality: { greater_than: 0 } 
  end
end
