# frozen_string_literal: true

module Workshop
  class RepairsController < ApplicationController
    before_action :set_workshop_repair, only: %i[edit update destroy]

    def index
      @workshop_repairs = Workshop::Repair.all
    end

    def edit; end

    def update
      if @workshop_repair.update(workshop_repair_params)
        redirect_to workshop_repairs_url, notice: 'Repair was successfully updated.'
      else
        render :edit
      end
    end

    def destroy
      @workshop_repair.destroy
      redirect_to workshop_repairs_url, notice: 'Repair was successfully destroyed.'
    end

    private

    def set_workshop_repair
      @workshop_repair = Workshop::Repair.find(params[:id])
    end

    def workshop_repair_params
      params.require(:workshop_repair).permit(:date, :mechanic_name, :car, :description, :total)
    end
  end
end
