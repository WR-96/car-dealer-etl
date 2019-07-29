# frozen_string_literal: true

module Parts
  class Provider < ApplicationRecord
    validates :tradename, :phone, :cellphone, :email, :car_maker, :piece, :price, presence: true
    validates :tradename, length: { maximum: 150 }
    validates :car_maker, length: { maximum: 50 }
    validates :piece, length: { maximum: 250 }
    validates :phone, length: { is: 7 }, numericality: { only_integer: true }
    validates :cellphone, length: { is: 10 }, numericality: { only_integer: true }
    validates :email, email: true
    validates :price, numericality: { greater_than: 0 }
  end
end
