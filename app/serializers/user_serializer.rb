# frozen_string_literal: true

# UserSerializer
class UserSerializer
  include JSONAPI::Serializer
  attributes :id, :user_name, :user_type, :email, :jti
end
