class UserSerializer
  include JSONAPI::Serializer
  attributes :id, :user_name, :user_type, :email
end
