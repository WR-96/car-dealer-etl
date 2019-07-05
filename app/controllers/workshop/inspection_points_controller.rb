# frozen_string_literal: true

module Workshop
  class InspectionPointsController < ApplicationController
    before_action :set_workshop_inspection_point, only: %i[edit update destroy]

    def index
      @workshop_inspection_points = Workshop::InspectionPoint.all
    end

    def edit; end

    def update
      if @workshop_inspection_point.update(workshop_inspection_point_params)
        redirect_to workshop_inspection_points_url, notice: 'Inspection point successfully updated.'
      else
        render :edit
      end
    end

    def destroy
      @workshop_inspection_point.destroy
      redirect_to workshop_inspection_points_url, notice: 'Inspection point successfully destroyed.'
    end

    private

    def set_workshop_inspection_point
      @workshop_inspection_point = Workshop::InspectionPoint.find(params[:id])
    end

    def workshop_inspection_point_params
      params.require(:workshop_inspection_point).permit(:car, :date, :point, :status, :comment)
    end
  end
end
