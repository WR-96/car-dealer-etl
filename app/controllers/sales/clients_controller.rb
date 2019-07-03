# frozen_string_literal: true

class Sales::ClientsController < ApplicationController
  before_action :set_sales_client, only: %i[edit update destroy]

  def index
    @sales_clients = Sales::Client.all
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
