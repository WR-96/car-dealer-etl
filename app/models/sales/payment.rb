# frozen_string_literal: true

module Sales
  class Payment < ApplicationRecord
    attribute :due_date, :date
    attribute :payment_date, :date
    validates :client_name, :status, :due_date, :payment_date, :amount, presence: true
    validates :client_name, length: { maximum: 50 }
    validates :status, inclusion: { in: %w[payed paying cancelled],
                                    message: "%{value} is not a valid status" }
    validates :due_date, :payment_date, date: true
    validates :amount, numericality: { greater_than: 0 }
  end
end
