# frozen_string_literal: true

module Parts
  class ProvidersController < ApplicationController
    before_action :set_parts_provider, only: %i[edit update destroy]

    def index
      @parts_providers = Parts::Provider.all
    end

    def edit; end

    def update
      if @parts_provider.update(parts_provider_params)
        redirect_to parts_providers_url, notice: 'Provider was successfully updated.'
      else
        render :edit
      end
    end

    def destroy
      @parts_provider.destroy
      redirect_to parts_providers_url, notice: 'Provider was successfully destroyed.'
    end

    private

    def set_parts_provider
      @parts_provider = Parts::Provider.find(params[:id])
    end

    def parts_provider_params
      params.require(:parts_provider).permit(:tradename, :phone, :cellphone, :email, :car_maker,
                                             :piece, :price)
    end
  end
end
