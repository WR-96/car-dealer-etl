# frozen_string_literal: true

module Workshop
  class ClientsController < ApplicationController
    before_action :set_workshop_client, only: %i[edit update destroy]

    def index
      @workshop_clients = Workshop::Client.all
    end

    def edit; end

    def update
      if @workshop_client.update(workshop_client_params)
        redirect_to workshop_clients_url, notice: 'Client was successfully updated.'
      else
        render :edit
      end
    end

    def destroy
      @workshop_client.destroy
      redirect_to workshop_clients_url, notice: 'Client was successfully destroyed.'
    end

    private

    def set_workshop_client
      @workshop_client = Workshop::Client.find(params[:id])
    end

    def workshop_client_params
      params.require(:workshop_client).permit(:name, :phone, :cellphone, :email, :rfc)
    end
  end
end
