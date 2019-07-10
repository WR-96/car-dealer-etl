# frozen_string_literal: true

module Parts
  class SaleReturnsController < ApplicationController
    before_action :set_parts_sale_return, only: %i[edit update destroy]

    def index
      @parts_sale_returns = Parts::SaleReturn.all
    end

    def edit; end

    def update
      if @parts_sale_return.update(parts_sale_return_params)
        redirect_to parts_sale_returns_url, notice: 'Sale return was successfully updated.'
      else
        render :edit
      end
    end

    def destroy
      @parts_sale_return.destroy
      redirect_to parts_sale_returns_url, notice: 'Sale return was successfully destroyed.'
    end

    private

    def set_parts_sale_return
      @parts_sale_return = Parts::SaleReturn.find(params[:id])
    end

    def parts_sale_return_params
      params.require(:parts_sale_return).permit(:client_name, :date, :article, :refound, :comment)
    end
  end
end
