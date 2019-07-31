# frozen_string_literal: true

module Parts
  class SupplierOrdersController < ApplicationController
    before_action :set_parts_supplier_order, only: %i[edit update destroy]

    def extract
      if Parts::SupplierOrder.all.empty?
        Ffdd::Parts::SupplierOrder.all.each do |row|
          new_row = Parts::SupplierOrder.new(row.attributes.except('id'))
          new_row.save(validate: false)
        end
        redirect_to parts_supplier_orders_url, notice: 'Data successfully extracted'
      else
        redirect_to parts_supplier_orders_url, notice: 'Data already extracted'
      end
    end

    def errors
      @parts_supplier_orders = Parts::SupplierOrder.all.reject(&:valid?)
      render :index
    end

    def index
      @parts_supplier_orders = Parts::SupplierOrder.all.reject(&:invalid?)
    end

    def edit; end

    def update
      if @parts_supplier_order.update(parts_supplier_order_params)
        redirect_to parts_supplier_orders_url, notice: 'Supplier order was successfully updated.'
      else
        render :edit
      end
    end

    def destroy
      @parts_supplier_order.destroy
      redirect_to parts_supplier_orders_url, notice: 'Supplier order was successfully destroyed.'
    end

    private

    def set_parts_supplier_order
      @parts_supplier_order = Parts::SupplierOrder.find(params[:id])
    end

    def parts_supplier_order_params
      params.require(:parts_supplier_order).permit(:employee_name, :date, :supplier_tradename,
                                                   :status, :delivery_date, :article, :amount,
                                                   :total)
    end
  end
end
