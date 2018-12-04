module Api
  module V1
    class ProductsController < ApplicationController

      def create
        @product = Product.new(product_params)
        if @product.save
          render json: @product, status: :created
        else
          render json: @product.errors, status: :unprocessable_entity
        end
      end

      def destroy
        @product = Product.find(params[:id])
        @product.destroy
      end


      private

      def product_params
        params.permit(:name, :price)
      end

    end
  end
end
