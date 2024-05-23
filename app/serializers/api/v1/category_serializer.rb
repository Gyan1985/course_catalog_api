module Api
  module V1
    class CategorySerializer < ActiveModel::Serializer
      attributes :id, :name, :vertical_id, :created_at, :updated_at
      
      has_many :courses

      def courses
        object.courses.map do |course|
          {
            id: course.id,
            name: course.name,
            author: course.author
          }
        end
      end
    end
  end
end
