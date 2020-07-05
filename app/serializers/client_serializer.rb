class ClientSerializer < ActiveModel::Serializer
  attributes :id, :name, :email, :created_at, :tags

  def created_at
    I18n.l(object.created_at, format: :descriptive_datetime)
  end

  def tags
    object.tags.map(&:name)
  end
end
