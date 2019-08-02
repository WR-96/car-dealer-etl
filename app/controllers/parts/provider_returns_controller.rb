# frozen_string_literal: true

module Parts
  class ProviderReturnsController < ApplicationController
    before_action :set_parts_provider_return, only: %i[edit update destroy]

    def load
      Parts::ProviderReturn.all.reject(&:invalid?).each do |record|
        Dwh::Parts::ProviderReturn.create(record.attributes.except('id'))
        record.destroy
      end

      redirect_to parts_provider_returns_url, notice: 'Data successfully loaded to DHW'
    end

    def extract
      if Parts::ProviderReturn.all.empty?
        Ffdd::Parts::ProviderReturn.all.each do |row|
          new_row = Parts::ProviderReturn.new(row.attributes.except('id'))
          new_row.save(validate: false)
        end
        redirect_to parts_provider_returns_url, notice: 'Data successfully extracted'
      else
        redirect_to parts_provider_returns_url, notice: 'Data already extracted'
      end
    end

    def errors
      @parts_provider_returns = Parts::ProviderReturn.all.reject(&:valid?)
      render :index
    end

    def index
      @parts_provider_returns = Parts::ProviderReturn.all.reject(&:invalid?)
    end

    def edit; end

    def update
      if @parts_provider_return.update(parts_provider_return_params)
        redirect_to parts_provider_returns_url, notice: 'Provider return was successfully updated.'
      else
        render :edit
      end
    end

    def destroy
      @parts_provider_return.destroy
      redirect_to parts_provider_returns_url, notice: 'Provider return was successfully destroyed.'
    end

    private

    def set_parts_provider_return
      @parts_provider_return = Parts::ProviderReturn.find(params[:id])
    end

    def parts_provider_return_params
      params.require(:parts_provider_return).permit(:provider_name, :date, :article, :refound,
                                                    :comment)
    end
  end
end
