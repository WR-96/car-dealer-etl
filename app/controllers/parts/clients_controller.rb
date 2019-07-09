# frozen_string_literal: true

class Parts::ClientsController < ApplicationController
  before_action :set_parts_client, only: %i[edit update destroy]

  def index
    @parts_clients = Parts::Client.all
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
