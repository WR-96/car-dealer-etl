# frozen_string_literal: true

module Sales
  class Bill < ApplicationRecord
    attribute :date, :date
    validates :client_name, :rfc, :date, :sub_total, :tax_percentage, :tax, :total, presence: true
    validates :client_name, length: { maximum: 50 }, format: { without: /\d/,
                                                              message: 'only allow letters' }
    validates :rfc, format: { with: /[A-Z]{4}\d\d(0[1-9]|1[012])([0-2]\d|30|31)([A-Z]|\d){3}/}
    validates :date, date: true
    validates :sub_total, :tax, :tax_percentage, numericality: true
    validates :total, numericality: { greater_than: 0 }
  end
end
