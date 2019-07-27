# frozen_string_literal: true

module Sales
  class Deal < ApplicationRecord
    attribute :date, :date
    validates :client_name, :agent_name, :car, :price, :date, :monthly_payment, :payment_due_day,
              presence: true
    validates :client_name, :agent_name, :car, length: { maximum: 50 }
    validates :client_name, :agent_name, format: { without: /\d/, message: 'only allow letters' }
    validates :price, :monthly_payment, numericality: { greater_than: 0 }
    validates :date, date: true
    validates :payment_due_day, numericality: { greater_than: 0, less_than: 26 }
  end
end
