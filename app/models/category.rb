class Category < ApplicationRecord
  belongs_to :vertical
  has_many :courses, dependent: :destroy
  accepts_nested_attributes_for :courses
  searchkick
  
  validates :name, presence: true, uniqueness: { scope: :vertical_id }
end
