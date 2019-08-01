# frozen_string_literal: true

require 'csv'

module Sales
  class AddressesController < ApplicationController
    before_action :set_sales_address, only: %i[edit update destroy]

    def extract
      if Sales::Address.all.empty?
        file_path = File.join(Rails.root, 'app/assets/csv/sales', 'addresses.csv')
        CSV.foreach(file_path, headers: true) do |row|
          new_row = Sales::Address.new(row.to_h.except('id'))
          new_row.save(validate: false)
        end

        redirect_to sales_addresses_url, notice: 'Data successfully extracted'
      else
        redirect_to sales_addresses_url, notice: 'Data already extracted'
      end
    end

    def errors
      @sales_addresses = Sales::Address.all.reject(&:valid?)
      render :index
    end

    def index
      @sales_addresses = Sales::Address.all.reject(&:invalid?)
    end

    def new
      @sales_address = Sales::Address.new
    end

    def edit; end

    def update
      if @sales_address.update(sales_address_params)
        redirect_to sales_addresses_url, notice: 'Address was successfully updated.'
      else
        render :edit
      end
    end

    def destroy
      @sales_address.destroy
      redirect_to sales_addresses_url, notice: 'Address was successfully destroyed.'
    end

    private

    def set_sales_address
      @sales_address = Sales::Address.find(params[:id])
    end

    def sales_address_params
      params.require(:sales_address).permit(:client_name, :address_line, :city, :state,
                                            :country, :zip_code)
    end
  end
end
