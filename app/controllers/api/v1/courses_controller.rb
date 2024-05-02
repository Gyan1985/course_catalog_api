module Api
  module V1
    class CoursesController < ApplicationController
      before_action :set_course, only: [:show, :update, :destroy]

      # GET /api/v1/courses
      def index
        params[:query] ||= '*'

        @courses = Course.search(params[:query], **search_options)
        render json: @courses.results
      end

      # GET /api/v1/courses/1
      def show
        render json: @course
      end

      # POST /api/v1/courses
      def create
        @course = Course.new(course_params)
        if @course.save
          render json: @course, status: :created
        else
          render json: @course.errors, status: :unprocessable_entity
        end
      end

      # PATCH/PUT /api/v1/courses/1
      def update
        if @course.update(course_params)
          render json: @course
        else
          render json: @course.errors, status: :unprocessable_entity
        end
      end

      # DELETE /api/v1/courses/1
      def destroy
        @course.destroy
      end

      private
        # Use callbacks to share common setup or constraints between actions.
        def set_course
          @course = Course.find(params[:id])
        end

        def course_params
          params.require(:course).permit(:name, :author, :category_id)
        end

        def search_options
          search_params = {
            page: (params[:page] || 1).to_i,
            per_page: (params[:per_page] || 10).to_i
          }
        
          search_params[:where] = { category_id: params[:category_id] } if params[:category_id].present?
        
          search_params
        end
    end
  end
end
