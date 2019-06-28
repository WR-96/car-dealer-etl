# frozen_string_literal: true

module Sales
  class EmployeesController < ApplicationController
    before_action :set_sales_employee, only: %i[edit update destroy]

    def index
      @sales_employees = Sales::Employee.all
    end

    def edit; end

    def update
      if @sales_employee.update(sales_employee_params)
        redirect_to sales_employees_url, notice: 'Employee was successfully updated.'
      else
        render :edit
      end
    end

    def destroy
      @sales_employee.destroy
      redirect_to sales_employees_url, notice: 'Employee was successfully destroyed.'
    end

    private

    def set_sales_employee
      @sales_employee = Sales::Employee.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def sales_employee_params
      params.require(:sales_employee).permit(:name, :last_name, :phone, :email)
    end
  end
end
