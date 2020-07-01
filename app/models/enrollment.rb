class Enrollment < ApplicationRecord
  belongs_to :client
  belongs_to :tag
end
