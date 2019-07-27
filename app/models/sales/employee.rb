# frozen_string_literal: true

module Sales
  class Employee < ApplicationRecord
    validates :name, :last_name, :phone, :email, presence: true
    validates :name, :last_name, length: { maximum: 50 }, format: { without: /\d/,
                                                                    message: 'only allow letters' }

    validates :name, :last_name, format: { with: /\A\D*\z/, message: 'number are not allow' }
    validates :phone, numericality: { only_integer: true }, length: { maximum: 7 }
    validates :email, email: true
  end
end
