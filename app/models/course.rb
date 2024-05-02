class Course < ApplicationRecord
  belongs_to :category
  searchkick

  validates :name, :author, presence: true
end
