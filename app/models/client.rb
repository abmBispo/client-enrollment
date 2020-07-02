class Client < ApplicationRecord
  validates :name, :email, presence: true
  validates :email, uniqueness: true, format: { with: URI::MailTo::EMAIL_REGEXP }

  has_many :enrollments, dependent: :destroy
  has_many :tags, through: :enrollments
end
