# frozen_string_literal: true

module Parts
  class SaleReturn < ApplicationRecord
    attribute :date, :date
    validates :client_name, :article, :date, :refound, :comment, presence: true
    validates :client_name, length: { maximum: 50 }, format: { without: /\d/,
                                                               message: 'only allow letters' }
    validates :article, :comment, length: { maximum: 250 }
    validates :date, date: true
    validates :refound, numericality: { greater_than: 0 }
  end
end
