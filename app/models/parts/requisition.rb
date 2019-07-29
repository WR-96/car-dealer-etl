# frozen_string_literal: true

module Parts
  class Requisition < ApplicationRecord
    attribute :date, :date
    attribute :delivery_date, :date

    validates :employee_name, :date, :status, :delivery_date, :article, :amount, presence: true
    validates :employee_name, length: { maximum: 50 }, format: { without: /\d/,
                                                                 message: 'only allow letters' }
    validates :article, length: { maximum: 250 }
    validates :date, :delivery_date, date: true
    validates :status, inclusion: { in: %w[shipped pending delivered canceled],
                                    message: "%{value} is not a valid status" }
    validates :amount, numericality: { only_integer: true, greater_than: 0 }
  end
end
