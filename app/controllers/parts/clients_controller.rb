# frozen_string_literal: true

module Parts
  class ClientsController < ApplicationController
    before_action :set_parts_client, only: %i[edit update destroy]

    def extract
      if Parts::Client.all.empty?
        Ffdd::Parts::Client.all.each do |row|
          new_row = Parts::Client.new(row.attributes.except('id'))
          new_row.save(validate: false)
        end
        redirect_to parts_clients_url, notice: 'Data successfully extracted'
      else
        redirect_to parts_clients_url, notice: 'Data already extracted'
      end
    end

    def errors
      @parts_clients = Parts::Client.all.reject(&:valid?)
      render :index
    end

    def index
      @parts_clients = Parts::Client.all.reject(&:invalid?)
    end

    def edit; end

    def update
      if @parts_client.update(parts_client_params)
        redirect_to parts_clients_url, notice: 'Client was successfully updated.'
      else
        render :edit
      end
    end

    def destroy
      @parts_client.destroy
      redirect_to parts_clients_url, notice: 'Client was successfully destroyed.'
    end

    private

    def set_parts_client
      @parts_client = Parts::Client.find(params[:id])
    end

    def parts_client_params
      params.require(:parts_client).permit(:name, :phone, :cellphone, :email, :rfc)
    end
  end
end
