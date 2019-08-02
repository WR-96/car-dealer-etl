# frozen_string_literal: true

module Parts
  class ProvidersController < ApplicationController
    before_action :set_parts_provider, only: %i[edit update destroy]

    def load
      Parts::Provider.all.reject(&:invalid?).each do |record|
        Dwh::Parts::Provider.create(record.attributes.except('id'))
        record.destroy
      end

      redirect_to parts_providers_url, notice: 'Data successfully loaded to DHW'
    end

    def extract
      if Parts::Provider.all.empty?
        Ffdd::Parts::Provider.all.each do |row|
          new_row = Parts::Provider.new(row.attributes.except('id'))
          new_row.save(validate: false)
        end
        redirect_to parts_providers_url, notice: 'Data successfully extracted'
      else
        redirect_to parts_providers_url, notice: 'Data already extracted'
      end
    end

    def errors
      @parts_providers = Parts::Provider.all.reject(&:valid?)
      render :index
    end

    def index
      @parts_providers = Parts::Provider.all.reject(&:invalid?)
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
