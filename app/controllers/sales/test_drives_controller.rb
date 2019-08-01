# frozen_string_literal: true

require 'csv'

module Sales
  class TestDrivesController < ApplicationController
    before_action :set_sales_test_drive, only: %i[edit update destroy]

    def extract
      if Sales::TestDrive.all.empty?
        file_path = File.join(Rails.root, 'app/assets/csv/sales', 'test_drives.csv')
        CSV.foreach(file_path, headers: true) do |row|
          new_row = Sales::TestDrive.new(row.to_h.except('id'))
          new_row.save(validate: false)
        end

        redirect_to sales_test_drives_url, notice: 'Data sucessfully extracted'
      else
        redirect_to sales_test_drives_url, notice: 'Data already extracted'
      end
    end

    def errors
      @sales_test_drives = Sales::TestDrive.all.reject(&:valid?)
      render :index
    end

    def index
      @sales_test_drives = Sales::TestDrive.all.reject(&:invalid?)
    end

    def new
      @sales_test_drive = Sales::TestDrive.new
    end

    def edit; end

    def update
      if @sales_test_drive.update(sales_test_drive_params)
        redirect_to sales_test_drives_url, notice: 'Test drive was successfully updated.'
      else
        render :edit
      end
    end

    def destroy
      @sales_test_drive.destroy
      redirect_to sales_test_drives_url, notice: 'Test drive was successfully destroyed.'
    end

    private

    def set_sales_test_drive
      @sales_test_drive = Sales::TestDrive.find(params[:id])
    end

    def sales_test_drive_params
      params.require(:sales_test_drive).permit(:client_name, :agent_name, :car, :date, :hour,
                                               :license_number, :inital_miles, :final_miles)
    end
  end
end
