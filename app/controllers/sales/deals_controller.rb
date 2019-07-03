# frozen_string_literal: true

module Sales
  class DealsController < ApplicationController
    before_action :set_sales_deal, only: %i[edit update destroy]

    def index
      @sales_deals = Sales::Deal.all
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
