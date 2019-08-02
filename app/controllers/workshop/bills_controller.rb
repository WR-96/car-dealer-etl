# frozen_string_literal: true

module Workshop
  class BillsController < ApplicationController
    before_action :set_workshop_bill, only: %i[edit update destroy]

    def load
      Workshop::Bill.all.reject(&:invalid?).each do |record|
        Dwh::Workshop::Bill.create(record.attributes.except('id'))
        record.destroy
      end

      redirect_to workshop_bills_url, notice: 'Data successfully loaded to DHW'
    end

    def extract
      if Workshop::Bill.all.empty?
        Ffdd::Workshop::Bill.all.each do |row|
          new_row = Workshop::Bill.new(row.attributes.except('id'))
          new_row.save(validate: false)
        end

        redirect_to workshop_bills_url, notice: 'Data extracted succesfully'
      else
        redirect_to workshop_bills_url, notice: 'Data already extracted'
      end
    end

    def errors
      @workshop_bills = Workshop::Bill.all.reject(&:valid?)

      render :index
    end

    def index
      @workshop_bills = Workshop::Bill.all.reject(&:invalid?)
    end

    def edit; end

    def update
      if @workshop_bill.update(workshop_bill_params)
        redirect_to workshop_bills_url, notice: 'Bill was successfully updated.'
      else
        render :edit
      end
    end

    def destroy
      @workshop_bill.destroy
      redirect_to workshop_bills_url, notice: 'Bill was successfully destroyed.'
    end

    private

    def set_workshop_bill
      @workshop_bill = Workshop::Bill.find(params[:id])
    end

    def workshop_bill_params
      params.require(:workshop_bill).permit(:client_name, :date, :sub_total, :tax_percentage,
                                            :tax_amount, :total, :service)
    end
  end
end
