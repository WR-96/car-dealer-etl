# frozen_string_literal: true

module Workshop
  class CarsController < ApplicationController
    before_action :set_workshop_car, only: %i[edit update destroy]

    def load
      Workshop::Car.all.reject(&:invalid?).each do |record|
        Dwh::Workshop::Car.create(record.attributes.except('id'))
        record.destroy
      end

      redirect_to workshop_cars_url, notice: 'Data successfully loaded to DHW'
    end

    def extract
      if Workshop::Car.all.empty?
        Ffdd::Workshop::Car.all.each do |row|
          new_row = Workshop::Car.new(row.attributes.except('id'))
          new_row.save(validate: false)
        end

        redirect_to workshop_cars_url, notice: 'Data extracted succesfully'
      else
        redirect_to workshop_cars_url, notice: 'Data already extracted'
      end
    end

    def errors
      @workshop_cars = Workshop::Car.all.reject(&:valid?)

      render :index
    end

    def index
      @workshop_cars = Workshop::Car.all.reject(&:invalid?)
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
