# frozen_string_literal: true

module Parts
  class BillsController < ApplicationController
    before_action :set_parts_bill, only: %i[edit update destroy]

    def load
      Parts::Bill.all.reject(&:invalid?).each do |record|
        Dwh::Parts::Bill.create(record.attributes.except('id'))
        record.destroy
      end

      redirect_to parts_bills_url, notice: 'Data successfully loaded to DHW'
    end

    def extract
      if Parts::Bill.all.empty?
        Ffdd::Parts::Bill.all.each do |row|
          new_row = Parts::Bill.new(row.attributes.except('id'))
          new_row.save(validate: false)
        end
        redirect_to parts_bills_url, notice: 'Data extracted succesfully'
      else
        redirect_to parts_bills_url, notice: 'Data already extracted'
      end
    end

    def errors
      @parts_bills = Parts::Bill.all.reject(&:valid?)
      render :index
    end

    def index
      @parts_bills = Parts::Bill.all.reject(&:invalid?)
    end

    def edit; end

    def update
      if @parts_bill.update(parts_bill_params)
        redirect_to parts_bills_url, notice: 'Bill was successfully updated.'
      else
        render :edit
      end
    end

    def destroy
      @parts_bill.destroy
      redirect_to parts_bills_url, notice: 'Bill was successfully destroyed.'
    end

    private

    def set_parts_bill
      @parts_bill = Parts::Bill.find(params[:id])
    end

    def parts_bill_params
      params.require(:parts_bill).permit(:client_name, :rfc, :date, :product, :price, :amount,
                                         :sub_total, :tax_percentage, :tax_amount, :total)
    end
  end
end
