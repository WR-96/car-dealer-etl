# frozen_string_literal: true

require 'csv'

module Sales
  class EmployeesController < ApplicationController
    before_action :set_sales_employee, only: %i[edit update destroy]

    def load
      Sales::Employee.all.reject(&:invalid?).each do |record|
        Dwh::Sales::Employee.create(record.attributes.except('id'))
        record.destroy
      end

      redirect_to sales_employees_url, notice: 'Data sucessfully loaded to DHW'
    end

    def extract
      if Sales::Employee.all.empty?
        file_path = File.join(Rails.root, 'app/assets/csv/sales', 'employees.csv')
        CSV.foreach(file_path, headers: true) do |row|
          new_row = Sales::Employee.new(row.to_h.except('id'))
          new_row.save(validate: false)
        end

        redirect_to sales_employees_url, notice: 'Data sucessfully extracted'
      else
        redirect_to sales_employees_url, notice: 'Data already extracted'
      end
    end

    def errors
      @sales_employees = Sales::Employee.all.reject(&:valid?)
      render :index
    end

    def index
      @sales_employees = Sales::Employee.all.reject(&:invalid?)
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
