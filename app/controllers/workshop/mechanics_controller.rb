# frozen_string_literal: true

module Workshop
  class MechanicsController < ApplicationController
    before_action :set_workshop_mechanic, only: %i[edit update destroy]

    def index
      @workshop_mechanics = Workshop::Mechanic.all
    end

    def edit; end

    def update
      if @workshop_mechanic.update(workshop_mechanic_params)
        redirect_to workshop_mechanics_url, notice: 'Mechanic was successfully updated.'
      else
        render :edit
      end
    end

    def destroy
      @workshop_mechanic.destroy
      redirect_to workshop_mechanics_url, notice: 'Mechanic was successfully destroyed.'
    end

    private

    def set_workshop_mechanic
      @workshop_mechanic = Workshop::Mechanic.find(params[:id])
    end

    def workshop_mechanic_params
      params.require(:workshop_mechanic).permit(:name, :phone, :cellphone, :email)
    end
  end
end
