# frozen_string_literal: true

require 'csv'

module Sales
  class BillsController < ApplicationController
    before_action :set_sales_bill, only: %i[edit update destroy]

    def load
      Sales::Bill.all.reject(&:invalid?).each do |record|
        Dwh::Sales::Bill.create(record.attributes.except('id'))
        record.destroy
      end

      redirect_to sales_bills_url, notice: 'Data sucessfully loaded to DHW'
    end

    def extract
      if Sales::Bill.all.empty?
        file_path = File.join(Rails.root, 'app/assets/csv/sales', 'bills.csv')
        CSV.foreach(file_path, headers: true) do |row|
          new_row = Sales::Bill.new(row.to_h.except('id'))
          new_row.save(validate: false)
        end

        redirect_to sales_bills_url, notice: 'Data sucessfully extracted'
      else
        redirect_to sales_bills_url, notice: 'Data already extracted'
      end
    end

    def errors
      @sales_bills = Sales::Bill.all.reject(&:valid?)
      render :index
    end

    def index
      @sales_bills = Sales::Bill.all.reject(&:invalid?)
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
      params.require(:sales_bill).permit(:client_name, :rfc, :date, :sub_total, :total,
                                         :tax_percentage, :tax)
    end
  end
end
