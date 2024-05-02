module Api
  module V1
    class VerticalsController < ApplicationController
      before_action :set_vertical, only: [:show, :update, :destroy]

      # GET /api/v1/verticals
      def index
        params[:query] ||= '*'

        @verticals = Vertical.search(params[:query], **search_options)
        render json: @verticals.results
      end

      # GET /api/v1/verticals/1
      def show
        render json: @vertical
      end

      # POST /api/v1/verticals
      def create
        @vertical = Vertical.new(vertical_params)
        if @vertical.save
          render json: @vertical, status: :created
        else
          render json: @vertical.errors, status: :unprocessable_entity
        end
      end

      # PATCH/PUT /api/v1/verticals/1
      def update
        if @vertical.update(vertical_params)
          render json: @vertical
        else
          render json: @vertical.errors, status: :unprocessable_entity
        end
      end

      # DELETE /api/v1/verticals/1
      def destroy
        @vertical.destroy
      end

      private
        # Use callbacks to share common setup or constraints between actions.
        def set_vertical
          @vertical = Vertical.find(params[:id])
        end

        # Only allow a trusted parameter "white list" through.
        def vertical_params
          params.require(:vertical).permit(:name, categories_attributes: [:id, :name, :_destroy, courses_attributes: [:id, :name, :author, :_destroy]])
        end

        def search_options
          search_params = {
            page: (params[:page] || 1).to_i,
            per_page: (params[:per_page] || 10).to_i
          }
        
          search_params
        end
    end
  end
end
