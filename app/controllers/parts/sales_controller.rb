# frozen_string_literal: true

module Parts
  class SalesController < ApplicationController
    before_action :set_parts_sale, only: %i[edit update destroy]

    def index
      @parts_sales = Parts::Sale.all
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
      params.require(:parts_sale).permit(:client_name, :employee_name, :date, :amount, :total)
    end
  end
end
