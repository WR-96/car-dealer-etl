# frozen_string_literal: true

require 'csv'

module Sales
  class PaymentsController < ApplicationController
    before_action :set_sales_payment, only: %i[edit update destroy]

    def load
      Sales::Payment.all.reject(&:invalid?).each do |record|
        Dwh::Sales::Payment.create(record.attributes.except('id'))
        record.destroy
      end

      redirect_to sales_payments_url, notice: 'Data sucessfully loaded to DHW'
    end

    def extract
      if Sales::Payment.all.empty?
        file_path = File.join(Rails.root, 'app/assets/csv/sales', 'payments.csv')
        CSV.foreach(file_path, headers: true) do |row|
          new_row = Sales::Payment.new(row.to_h.except('id'))
          new_row.save(validate: false)
        end

        redirect_to sales_payments_url, notice: 'Data sucessfully extracted'
      else
        redirect_to sales_payments_url, notice: 'Data already extracted'
      end
    end

    def errors
      @sales_payments = Sales::Payment.all.reject(&:valid?)
      render :index
    end

    def index
      @sales_payments = Sales::Payment.all.reject(&:invalid?)
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
