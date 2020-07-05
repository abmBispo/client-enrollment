class EnrollmentSerializer < ActiveModel::Serializer
  attributes :id, :name, :created_at
  belongs_to :tag

  def created_at
    I18n.l(object.created_at, format: :descriptive_datetime)
  end
end
