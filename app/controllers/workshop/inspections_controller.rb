# frozen_string_literal: true

module Workshop
  class InspectionsController < ApplicationController
    before_action :set_workshop_inspection, only: %i[edit update destroy]

    def index
      @workshop_inspections = Workshop::Inspection.all
    end

    def edit; end

    def update
      if @workshop_inspection.update(workshop_inspection_params)
        redirect_to workshop_inspections_url, notice: 'Inspection was successfully updated.'
      else
        render :edit
      end
    end

    def destroy
      @workshop_inspection.destroy
      redirect_to workshop_inspections_url, notice: 'Inspection was successfully destroyed.'
    end

    private

    def set_workshop_inspection
      @workshop_inspection = Workshop::Inspection.find(params[:id])
    end

    def workshop_inspection_params
      params.require(:workshop_inspection).permit(:car, :mechanic_name, :date, :mileage,
                                                  :fuel_level, :comment)
    end
  end
end
