# frozen_string_literal: true

module Parts
  class SalesController < ApplicationController
    before_action :set_parts_sale, only: %i[edit update destroy]

    def load
      Parts::Sale.all.reject(&:invalid?).each do |record|
        Dwh::Parts::Sale.create(record.attributes.except('id'))
        record.destroy
      end

      redirect_to parts_sales_url, notice: 'Data successfully loaded to DHW'
    end

    def extract
      if Parts::Sale.all.empty?
        Ffdd::Parts::Sale.all.each do |row|
          new_row = Parts::Sale.new(row.attributes.except('id'))
          new_row.save(validate: false)
        end
        redirect_to parts_sales_url, notice: 'Data successfully extracted'
      else
        redirect_to parts_sales_url, notice: 'Data already extracted'
      end
    end

    def errors
      @parts_sales = Parts::Sale.all.reject(&:valid?)
      render :index
    end

    def index
      @parts_sales = Parts::Sale.all.reject(&:invalid?)
    end

    def edit; end

    def update
      if @parts_sale.update(parts_sale_params)
        redirect_to parts_sales_url, notice: 'Sale was successfully updated.'
      else
        render :edit
      end
    end

    def destroy
      @parts_sale.destroy
      redirect_to parts_sales_url, notice: 'Sale was successfully destroyed.'
    end

    private

    def set_parts_sale
      @parts_sale = Parts::Sale.find(params[:id])
    end

    def parts_sale_params
      params.require(:parts_sale).permit(:client_name, :employee_name, :date, :amount, :total,
                                         :price, :product)
    end
  end
end
