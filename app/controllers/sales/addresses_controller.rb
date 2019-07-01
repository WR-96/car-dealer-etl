# frozen_string_literal: true

module Sales
  class AddressesController < ApplicationController
    before_action :set_sales_address, only: %i[edit update destroy]

    def index
      @sales_addresses = Sales::Address.all
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
