# frozen_string_literal: true

module Sales
  class CarsController < ApplicationController
    before_action :set_sales_car, only: %i[edit update destroy]

    def index
      @sales_cars = Sales::Car.all
    end

    def show; end

    def new
      @sales_car = Sales::Car.new
    end

    def edit; end

    def update
      if @sales_car.update(sales_car_params)
        redirect_to sales_cars_url, notice: 'Car was successfully updated.'
      else
        render :edit
      end
    end

    def destroy
      @sales_car.destroy
      redirect_to sales_cars_url, notice: 'Car was successfully destroyed.'
    end

    private

    def set_sales_car
      @sales_car = Sales::Car.find(params[:id])
    end

    def sales_car_params
      params.require(:sales_car).permit(:model, :category, :maker, :color, :year, :price, :miles,
                                        :serial_number, :purchase_date)
    end
  end
end
