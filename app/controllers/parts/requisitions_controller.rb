# frozen_string_literal: true

module Parts
  class RequisitionsController < ApplicationController
    before_action :set_parts_requisition, only: %i[edit update destroy]

    def load
      Parts::Requisition.all.reject(&:invalid?).each do |record|
        Dwh::Parts::Requisition.create(record.attributes.except('id'))
        record.destroy
      end

      redirect_to parts_requisitions_url, notice: 'Data successfully loaded to DHW'
    end

    def extract
      if Parts::Requisition.all.empty?
        Ffdd::Parts::Requisition.all.each do |row|
          new_row = Parts::Requisition.new(row.attributes.except('id'))
          new_row.save(validate: false)
        end
        redirect_to parts_requisitions_url, notice: 'Data successfully extracted'
      else
        redirect_to parts_requisitions_url, notice: 'Data already extracted'
      end
    end

    def errors
      @parts_requisitions = Parts::Requisition.all.reject(&:valid?)
      render :index
    end

    def index
      @parts_requisitions = Parts::Requisition.all.reject(&:invalid?)
    end

    def edit; end

    def update
      if @parts_requisition.update(parts_requisition_params)
        redirect_to parts_requisitions_url, notice: 'Requisition was successfully updated.'
      else
        render :edit
      end
    end

    def destroy
      @parts_requisition.destroy
      redirect_to parts_requisitions_url, notice: 'Requisition was successfully destroyed.'
    end

    private

    def set_parts_requisition
      @parts_requisition = Parts::Requisition.find(params[:id])
    end

    def parts_requisition_params
      params.require(:parts_requisition).permit(:employee_name, :date, :status, :delivery_date,
                                                :article, :amount)
    end
  end
end
