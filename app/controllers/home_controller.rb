# frozen_string_literal: true

class HomeController < ApplicationController
  before_action :authenticate_user!
  before_action :set_models

  Car = Dwh::Sales::Car
  Piece = Dwh::Workshop::Piece
  Provider = Dwh::Parts::Provider

  def index; end

  def query
    @provider_attr = params[:provider_attr]
    @piece_attr = params[:piece_attr]
    @car_attr = params[:car_attr]

    @car_values = Car.select(@car_attr).map { |car| car[@car_attr] } 
    @piece_values = Piece.select(@piece_attr).map { |piece| piece[@piece_attr] }
    @provider_values = Provider.select(@provider_attr).map { |provider| provider[@provider_attr] }

    render :index
  end

  private

  def set_models
    @car = Sales::Car.new
    @part = Workshop::Piece.new
    @provider = Parts::Provider.new
    @provider_values = []
    @piece_values = []
    @car_values = [] 
  end
end
