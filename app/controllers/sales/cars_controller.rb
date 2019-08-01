# frozen_string_literal: true

require 'csv'

module Sales
  class CarsController < ApplicationController
    before_action :set_sales_car, only: %i[edit update destroy]

    def extract
      if Sales::Car.all.empty?
        file_path = File.join(Rails.root, 'app/assets/csv/sales', 'cars.csv')
        CSV.foreach(file_path, headers: true) do |row|
          new_row = Sales::Car.new(row.to_h.except('id'))
          new_row.save(validate: false)
        end

        redirect_to sales_cars_url, notice: 'Data sucessfully extracted'
      else
        redirect_to sales_cars_url, notice: 'Data already extracted'
      end
    end

    def errors
      @sales_cars = Sales::Car.all.reject(&:valid?)
      render :index
    end

    def index
      @sales_cars = Sales::Car.all.reject(&:invalid?)
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
