# frozen_string_literal: true

require 'csv'

module Sales
  class DealsController < ApplicationController
    before_action :set_sales_deal, only: %i[edit update destroy]

    def load
      Sales::Deal.all.reject(&:invalid?).each do |record|
        Dwh::Sales::Deal.create(record.attributes.except('id'))
        record.destroy
      end

      redirect_to sales_deals_url, notice: 'Data sucessfully loaded to DHW'
    end

    def extract
      if Sales::Deal.all.empty?
        file_path = File.join(Rails.root, 'app/assets/csv/sales', 'deals.csv')
        CSV.foreach(file_path, headers: true) do |row|
          new_row = Sales::Deal.new(row.to_h.except('id'))
          new_row.save(validate: false)
        end

        redirect_to sales_deals_url, notice: 'Data sucessfully extracted'
      else
        redirect_to sales_deals_url, notice: 'Data already extracted'
      end
    end

    def errors
      @sales_deals = Sales::Deal.all.reject(&:valid?)
      render :index
    end

    def index
      @sales_deals = Sales::Deal.all.reject(&:invalid?)
    end

    def new
      @sales_deal = Sales::Deal.new
    end

    def edit; end

    def update
      if @sales_deal.update(sales_deal_params)
        redirect_to sales_deals_url, notice: 'Deal was successfully updated.'
      else
        render :edit
      end
    end

    def destroy
      @sales_deal.destroy
      redirect_to sales_deals_url, notice: 'Deal was successfully destroyed.'
    end

    private

    def set_sales_deal
      @sales_deal = Sales::Deal.find(params[:id])
    end

    def sales_deal_params
      params.require(:sales_deal).permit(:client_name, :agent_name, :car, :price, :date,
                                         :monthly_payment, :payment_due_day)
    end
  end
end
