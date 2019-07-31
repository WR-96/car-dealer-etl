# frozen_string_literal: true

module Parts
  class SparePartsController < ApplicationController
    before_action :set_parts_spare_part, only: %i[edit update destroy]

    def extract
      if Parts::SparePart.all.empty?
        Ffdd::Parts::SparePart.all.each do |row|
          new_row = Parts::SparePart.new(row.attributes.except('id'))
          new_row.save(validate: false)
        end
        redirect_to parts_spare_parts_url, notice: 'Data successfully extracted'
      else
        redirect_to parts_spare_parts_url, notice: 'Data already extracted'
      end
    end

    def errors
      @parts_spare_parts = Parts::SparePart.all.reject(&:valid?)
      render :index
    end

    def index
      @parts_spare_parts = Parts::SparePart.all.reject(&:invalid?)
    end

    def edit; end

    def update
      if @parts_spare_part.update(parts_spare_part_params)
        redirect_to parts_spare_parts_url, notice: 'Spare part was successfully updated.'
      else
        render :edit
      end
    end

    def destroy
      @parts_spare_part.destroy
      redirect_to parts_spare_parts_url, notice: 'Spare part was successfully destroyed.'
    end

    private

    def set_parts_spare_part
      @parts_spare_part = Parts::SparePart.find(params[:id])
    end

    def parts_spare_part_params
      params.require(:parts_spare_part).permit(:description, :car_model, :car_maker, :price,
                                               :stock, :reorder)
    end
  end
end
