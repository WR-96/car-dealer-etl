# frozen_string_literal: true

module Workshop
  class BookingsController < ApplicationController
    before_action :set_workshop_booking, only: %i[edit update destroy]

    def index
      @workshop_bookings = Workshop::Booking.all
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
