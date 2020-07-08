class Enrollment < ApplicationRecord
  belongs_to :client, optional: true
  belongs_to :tag
  validates :name, presence: true
  validates :name, uniqueness: true
end
