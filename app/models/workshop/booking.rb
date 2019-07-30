# frozen_string_literal: true

module Workshop
  class Booking < ApplicationRecord
    attribute :date, :date
    validates :mechanic_name, :client_name, :car, :date, :hour, :description, presence: true
    validates :mechanic_name, :client_name, :car, length: { maximum: 50 }
    validates :mechanic_name, :client_name, format: { without: /\d/,
                                                      message: 'only allow letters' }
    validates :date, date: true
    validates :hour, format: { with: /\A(2[0-3]|[01]?\d):[0-5]\d\z/,
                               message: 'needs to be in 24hr format "HH:MM"' }
    validates :description, length: { maximum: 250 }
  end
end
