# frozen_string_literal: true

module Workshop
  class Repair < ApplicationRecord
    attribute :date, :date
    validates :date, :mechanic_name, :car, :description, :total, presence: true
    validates :mechanic_name, :car, length: { maximum: 50 }
    validates :mechanic_name, format: { without: /\d/, message: 'only allow letters' }
    validates :date, date: true
    validates :description, length: { maximum: 250 }
    validates :total, numericality: { greater_than: 0 }
  end
end
