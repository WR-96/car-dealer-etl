# frozen_string_literal: true

module Parts
  class EmployeesController < ApplicationController
    before_action :set_parts_employee, only: %i[edit update destroy]

    def load
      Parts::Employee.all.reject(&:invalid?).each do |record|
        Dwh::Parts::Employee.create(record.attributes.except('id'))
        record.destroy
      end

      redirect_to parts_employees_url, notice: 'Data successfully loaded to DHW'
    end

    def extract
      if Parts::Employee.all.empty?
        Ffdd::Parts::Employee.all.each do |row|
          new_row = Parts::Employee.new(row.attributes.except('id'))
          new_row.save(validate: false)
        end
        redirect_to parts_employees_url, notice: 'Data successfully extracted'
      else
        redirect_to parts_employees_url, notice: 'Data already extracted'
      end
    end

    def errors
      @parts_employees = Parts::Employee.all.reject(&:valid?)
      render :index
    end

    def index
      @parts_employees = Parts::Employee.all.reject(&:invalid?)
    end

    def edit; end

    def update
      if @parts_employee.update(parts_employee_params)
        redirect_to parts_employees_url, notice: 'Employee was successfully updated.'
      else
        render :edit
      end
    end

    def destroy
      @parts_employee.destroy
      redirect_to parts_employees_url, notice: 'Employee was successfully destroyed.'
    end

    private

    def set_parts_employee
      @parts_employee = Parts::Employee.find(params[:id])
    end

    def parts_employee_params
      params.require(:parts_employee).permit(:name, :phone, :cellphone,
                                             :email)
    end
  end
end
