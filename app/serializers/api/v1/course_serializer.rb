module Api
  module V1
    class CourseSerializer < ActiveModel::Serializer
      attributes :id, :name, :author, :category_id, :created_at, :updated_at
    end
  end
end
