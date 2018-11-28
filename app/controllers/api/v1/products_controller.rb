module Api
  module V1
    class ProductsController < ApplicationController
      def index
        render json: Product.all 
      end

      private

      def product_params
        params.permit(:name, :price)
      end
    end
  end
end
