class Vertical < ApplicationRecord
  has_many :categories, dependent: :destroy
  accepts_nested_attributes_for :categories
  searchkick

  validates :name, presence: true, uniqueness: true
end
