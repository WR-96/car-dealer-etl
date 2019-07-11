# frozen_string_literal: true

module Parts
  class ProviderReturnsController < ApplicationController
    before_action :set_parts_provider_return, only: %i[edit update destroy]

    def index
      @parts_provider_returns = Parts::ProviderReturn.all
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
