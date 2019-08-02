# frozen_string_literal: true

module Workshop
  class BookingsController < ApplicationController
    before_action :set_workshop_booking, only: %i[edit update destroy]

    def load
      Workshop::Booking.all.reject(&:invalid?).each do |record|
        Dwh::Workshop::Booking.create(record.attributes.except('id'))
        record.destroy
      end

      redirect_to workshop_bookings_url, notice: 'Data successfully loaded to DHW'
    end

    def extract
      if Workshop::Booking.all.empty?
        Ffdd::Workshop::Booking.all.each do |row|
          new_row = Workshop::Booking.new(row.attributes.except('id'))
          new_row.save(validate: false)
        end

        redirect_to workshop_bookings_url, notice: 'Data extracted succesfully'
      else
        redirect_to workshop_bookings_url, notice: 'Data already extracted'
      end
    end

    def errors
      @workshop_bookings = Workshop::Booking.all.reject(&:valid?)

      render :index
    end

    def index
      @workshop_bookings = Workshop::Booking.all.reject(&:invalid?)
    end

    def edit; end

    def update
      if @workshop_booking.update(workshop_booking_params)
        redirect_to workshop_bookings_url, notice: 'Booking was successfully updated.'
      else
        render :edit
      end
    end

    def destroy
      @workshop_booking.destroy
      redirect_to workshop_bookings_url, notice: 'Booking was successfully destroyed.'
    end

    private

    def set_workshop_booking
      @workshop_booking = Workshop::Booking.find(params[:id])
    end

    def workshop_booking_params
      params.require(:workshop_booking).permit(:mechanic_name, :client_name, :car, :date, :hour,
                                               :description)
    end
  end
end
