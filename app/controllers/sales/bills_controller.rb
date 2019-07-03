# frozen_string_literal: true

module Sales
  class BillsController < ApplicationController
    before_action :set_sales_bill, only: %i[edit update destroy]

    def index
      @sales_bills = Sales::Bill.all
    end

    def new
      @sales_bill = Sales::Bill.new
    end

    def edit; end

    def update
      if @sales_bill.update(sales_bill_params)
        redirect_to sales_bills_url, notice: 'Bill was successfully updated.'
      else
        render :edit
      end
    end

    def destroy
      @sales_bill.destroy
      redirect_to sales_bills_url, notice: 'Bill was successfully destroyed.'
    end

    private

    def set_sales_bill
      @sales_bill = Sales::Bill.find(params[:id])
    end

    def sales_bill_params
      params.require(:sales_bill).permit(:deal_number, :date, :sub_total, :total, :tax_percentage,
                                         :tax)
    end
  end
end
