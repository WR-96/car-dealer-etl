# frozen_string_literal: true

require 'csv'

module Sales
  class ClientsController < ApplicationController
    before_action :set_sales_client, only: %i[edit update destroy]

    def load
      Sales::Client.all.reject(&:invalid?).each do |record|
        Dwh::Sales::Client.create(record.attributes.except('id'))
        record.destroy
      end

      redirect_to sales_clients_url, notice: 'Data sucessfully loaded to DHW'
    end

    def extract
      if Sales::Client.all.empty?
        file_path = File.join(Rails.root, 'app/assets/csv/sales', 'clients.csv')
        CSV.foreach(file_path, headers: true) do |row|
          new_row = Sales::Client.new(row.to_h.except('id'))
          new_row.save(validate: false)
        end

        redirect_to sales_clients_url, notice: 'Data sucessfully extracted'
      else
        redirect_to sales_clients_url, notice: 'Data already extracted'
      end
    end

    def errors
      @sales_clients = Sales::Client.all.reject(&:valid?)
      render :index
    end

    def index
      @sales_clients = Sales::Client.all.reject(&:invalid?)
    end

    def new
      @sales_client = Sales::Client.new
    end

    def edit; end

    def update
      if @sales_client.update(sales_client_params)
        redirect_to sales_clients_url, notice: 'Client was successfully updated.'
      else
        render :edit
      end
    end

    def destroy
      @sales_client.destroy
      redirect_to sales_clients_url, notice: 'Client was successfully destroyed.'
    end

    private

    def set_sales_client
      @sales_client = Sales::Client.find(params[:id])
    end

    def sales_client_params
      params.require(:sales_client).permit(:name, :phone, :cellphone, :email, :rfc)
    end
  end
end
