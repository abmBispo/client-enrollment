class ClientSerializer < ActiveModel::Serializer
  attributes :id, :name, :email, :created_at
  has_many :tags

  def created_at
    I18n.l(object.created_at, format: :descriptive_datetime)
  end
end
