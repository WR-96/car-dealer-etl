# frozen_string_literal: true

module Workshop
  class CarsController < ApplicationController
    before_action :set_workshop_car, only: %i[edit update destroy]

    def index
      @workshop_cars = Workshop::Car.all
    end

    def edit; end

    def update
      if @workshop_car.update(workshop_car_params)
        redirect_to workshop_cars_url, notice: 'Car was successfully updated.'
      else
        render :edit
      end
    end

    def destroy
      @workshop_car.destroy
      redirect_to workshop_cars_url, notice: 'Car was successfully destroyed.'
    end

    private

    def set_workshop_car
      @workshop_car = Workshop::Car.find(params[:id])
    end

    def workshop_car_params
      params.require(:workshop_car).permit(:client_name, :maker, :car, :color, :year,
                                           :license_plate, :serial_number)
    end
  end
end
