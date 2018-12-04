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

      def edit
        @product = Product.find(params[:id])
      end

      def update
        product = Product.find(params[:id])
        if product.update(product_params)
          render json: product, status: 200
        else
          render json: {errors: product.errors}, status: 422
        end
      end

      def destroy
        product =Product.find(params[:id])
        if product.destroy
          render json: {}, status: 204
        end
      end


      private

      def product_params
        params.permit(:name, :price)
      end

    end
  end
end
