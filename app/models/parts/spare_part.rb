# frozen_string_literal: true

module Parts
  class SparePart < ApplicationRecord
    validates :description, :car_model, :car_maker, :price, :stock, :reorder, presence: true
    validates :description, length: { maximum: 250 }
    validates :car_model, :car_maker, length: { maximum: 50 }
    validates :price, numericality: { greater_than: 0 }
    validates :reorder, numericality: { only_integer: true, greater_than: 0 }
    validates :stock, numericality: { only_integer: true, greater_than_or_equal_to: 0 }
  end
end
