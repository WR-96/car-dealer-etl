# frozen_string_literal: true

module Parts
  class EmployeesController < ApplicationController
    before_action :set_parts_employee, only: %i[edit update destroy]

    def index
      @parts_employees = Parts::Employee.all
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
