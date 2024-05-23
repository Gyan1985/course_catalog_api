module Api
  module V1
    class VerticalSerializer < ActiveModel::Serializer
      attributes :id, :name, :created_at, :updated_at
      has_many :categories
    end
  end
end
