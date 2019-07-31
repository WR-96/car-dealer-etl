# frozen_string_literal: true

module Workshop
  class MechanicsController < ApplicationController
    before_action :set_workshop_mechanic, only: %i[edit update destroy]

    def extract
      if Workshop::Mechanic.all.empty?
        Ffdd::Workshop::Mechanic.all.each do |row|
          new_row = Workshop::Mechanic.new(row.attributes.except('id'))
          new_row.save(validate: false)
        end

        redirect_to workshop_mechanics_url, notice: 'Data extracted succesfully'
      else
        redirect_to workshop_mechanics_url, notice: 'Data already extracted'
      end
    end

    def errors
      @workshop_mechanics = Workshop::Mechanic.all.reject(&:valid?)

      render :index
    end

    def index
      @workshop_mechanics = Workshop::Mechanic.all.reject(&:invalid?)
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
