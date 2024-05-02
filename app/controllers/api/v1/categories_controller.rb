module Api
  module V1
    class CategoriesController < ApplicationController
      before_action :set_category, only: [:show, :update, :destroy]

      # GET /api/v1/categories
      def index
        params[:query] ||= '*'

        @categories = Category.search(params[:query], **search_options)
        render json: @categories.results, status: :ok
      end

      # GET /api/v1/categories/1
      def show
        render json: @category, status: :ok
      end

      # POST /api/v1/categories
      def create
        @category = Category.new(category_params)
        if @category.save
          render json: @category, status: :created
        else
          render json: @category.errors, status: :unprocessable_entity
        end
      end

      # PATCH/PUT /api/v1/categories/1
      def update
        if @category.update(category_params)
          render json: @category
        else
          render json: @category.errors, status: :unprocessable_entity
        end
      end

      # DELETE /api/v1/categories/1
      def destroy
        @category.destroy
      end

      private
        # Use callbacks to share common setup or constraints between actions.
        def set_category
          @category = Category.find(params[:id])
        end

        def category_params
          params.require(:category).permit(:name, :vertical_id, courses_attributes: [:id, :name, :author])
        end

        def search_options
          search_params = {
            page: (params[:page] || 1).to_i ,
            per_page: (params[:per_page] || 10).to_i
          }
        
          search_params[:where] = { vertical_id: params[:vertical_id] } if params[:vertical_id].present?
        
          search_params
        end
    end
  end
end
