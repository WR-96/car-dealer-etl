# frozen_string_literal: true

module Sales
  class PaymentsController < ApplicationController
    before_action :set_sales_payment, only: %i[edit update destroy]

    def index
      @sales_payments = Sales::Payment.all
    end

    def new
      @sales_payment = Sales::Payment.new
    end

    def edit; end

    def update
      if @sales_payment.update(sales_payment_params)
        redirect_to sales_payments_url, notice: 'Payment was successfully updated.'
      else
        render :edit
      end
    end

    def destroy
      @sales_payment.destroy
      redirect_to sales_payments_url, notice: 'Payment was successfully destroyed.'
    end

    private

    def set_sales_payment
      @sales_payment = Sales::Payment.find(params[:id])
    end

    def sales_payment_params
      params.require(:sales_payment).permit(:client_name, :status, :due_date, :payment_date,
                                            :amount)
    end
  end
end
