# frozen_string_literal: true

module Workshop
  class PiecesController < ApplicationController
    before_action :set_workshop_piece, only: %i[edit update destroy]

    def load
      Workshop::Piece.all.reject(&:invalid?).each do |record|
        Dwh::Workshop::Piece.create(record.attributes.except('id'))
        record.destroy
      end

      redirect_to workshop_pieces_url, notice: 'Data successfully loaded to DHW'
    end

    def extract
      if Workshop::Piece.all.empty?
        Ffdd::Workshop::Piece.all.each do |row|
          new_row = Workshop::Piece.new(row.attributes.except('id'))
          new_row.save(validate: false)
        end

        redirect_to workshop_pieces_url, notice: 'Data extracted succesfully'
      else
        redirect_to workshop_pieces_url, notice: 'Data already extracted'
      end
    end

    def errors
      @workshop_pieces = Workshop::Piece.all.reject(&:valid?)

      render :index
    end

    def index
      @workshop_pieces = Workshop::Piece.all.reject(&:invalid?)
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
