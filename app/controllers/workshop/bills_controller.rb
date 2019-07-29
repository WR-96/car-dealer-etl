# frozen_string_literal: true

module Workshop
  class BillsController < ApplicationController
    before_action :set_workshop_bill, only: %i[edit update destroy]

    def index
      @workshop_bills = Workshop::Bill.all
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
