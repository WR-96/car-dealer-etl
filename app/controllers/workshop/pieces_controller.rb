# frozen_string_literal: true

module Workshop
  class PiecesController < ApplicationController
    before_action :set_workshop_piece, only: %i[edit update destroy]

    def index
      @workshop_pieces = Workshop::Piece.all
    end

    def edit; end

    def update
      if @workshop_piece.update(workshop_piece_params)
        redirect_to workshop_pieces_url, notice: 'Piece was successfully updated.'
      else
        render :edit
      end
    end

    def destroy
      @workshop_piece.destroy
      redirect_to workshop_pieces_url, notice: 'Piece was successfully destroyed.'
    end

    private

    def set_workshop_piece
      @workshop_piece = Workshop::Piece.find(params[:id])
    end

    def workshop_piece_params
      params.require(:workshop_piece).permit(:car, :maker, :description, :price)
    end
  end
end
