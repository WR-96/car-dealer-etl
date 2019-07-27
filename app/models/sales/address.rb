# frozen_string_literal: true

module Sales
  class Address < ApplicationRecord
    validates :client_name, :address_line, :city, :state, :country, :zip_code, presence: true
    validates :client_name, length: { maximum: 50 }, format: { without: /\d/,
                                                               message: 'only allow letters' }

    validates :address_line, :city, :state, :country, length: { maximum: 100 }
    validates :zip_code, numericality: { only_integer: true }, length: { is: 5 }
  end
end
