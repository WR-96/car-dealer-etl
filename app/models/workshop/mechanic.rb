# frozen_string_literal: true

module Workshop
  class Mechanic < ApplicationRecord
    validates :name, :phone, :cellphone, :email, presence: true
    validates :name, length: { maximum: 50 }, format: { without: /\d/,
                                                         message: 'only allow letters'}
    validates :phone, length: { is: 7 }, numericality: { only_integer: true }
    validates :cellphone, length: { is: 10 }, numericality: { only_integer: true }
    validates :email, email: true
  end
end
