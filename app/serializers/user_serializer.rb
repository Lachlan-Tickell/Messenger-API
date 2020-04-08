class UserSerializer < ActiveModel::Serializer

    attributes :id, :first_name, :last_name

    has_many :conversations, include_nested_associations: true
end