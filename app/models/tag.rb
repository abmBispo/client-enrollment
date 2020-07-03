class Tag < ApplicationRecord
  validates :name, presence: true
  validates :name, uniqueness: true

  has_many :enrollments, dependent: :destroy
  has_many :clients, through: :enrollments
end
