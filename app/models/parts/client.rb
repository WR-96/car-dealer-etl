# frozen_string_literal: true

module Parts
  class Client < ApplicationRecord
    validates :name, :phone, :cellphone, :email, :rfc, presence: true
    validates :name, length: { maximum: 50 }, format: { without: /\d/,
                                                         message: 'only allow letters'}
    validates :phone, length: { is: 7 }, numericality: { only_integer: true }
    validates :cellphone, length: { is: 10 }, numericality: { only_integer: true }
    validates :email, email: true
    validates :rfc, format: { with: /[A-Z]{4}\d\d(0[1-9]|1[012])([0-2]\d|30|31)([A-Z]|\d){3}/ }
  end
end
