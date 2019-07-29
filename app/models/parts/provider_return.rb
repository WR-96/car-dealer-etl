# frozen_string_literal: true

module Parts
  class ProviderReturn < ApplicationRecord
    attribute :date, :date
    validates :provider_name, :article, :date, :refound, :comment, presence: true
    validates :provider_name, length: { maximum: 50 }
    validates :article, :comment, length: { maximum: 250 }
    validates :date, date: true
    validates :refound, numericality: { greater_than: 0 }
  end
end
