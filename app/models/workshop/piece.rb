# frozen_string_literal: true

module Workshop
  class Piece < ApplicationRecord
    validates :description, :maker, :car, :price, presence: true
    validates :description, length: { maximum: 250 }
    validates :maker, :car, length: { maximum: 50 }
    validates :price, numericality: { greater_than: 0 }
  end
end
