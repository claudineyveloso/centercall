# frozen_string_literal: true

# ApplicationController
class ApplicationController < ActionController::Base
  protect_from_forgery with: :null_session,
                       if: proc { |c| c.request.format =~ %r{application/json} }
  # before_action :cors_preflight_check
  # after_action :cors_set_access_control_headers
  before_action :configure_permitted_parameters, if: :devise_controller?

  protected

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: %i[user_name user_type email avatar])
    devise_parameter_sanitizer.permit(:account_update, keys: %i[user_name user_type email avatar])
  end

  def cors_set_access_control_headers
    response.headers['Access-Control-Allow-Origin'] = 'http://localhost:4000'
    response.headers['Access-Control-Allow-Credentials'] = 'true'
    response.headers['Access-Control-Allow-Methods'] = 'POST, GET, PUT, PATCH, DELETE, OPTIONS'
    response.headers['Access-Control-Allow-Headers'] = 'Origin, Content-Type, Accept, Authorization, Token, Auth-Token, Email, X-User-Token, X-User-Email'
    response.headers['Access-Control-Max-Age'] = '86400'
  end

  # If this is a preflight OPTIONS request, then short-circuit the
  # request, return only the necessary headers and return an empty
  # text/plain.

  def cors_preflight_check
    return unless request.method == :options

    headers['Access-Control-Allow-Origin'] = '*'
    headers['Access-Control-Allow-Methods'] = 'POST,DELETE, GET, PUT, PATCH, OPTIONS'
    headers['Access-Control-Allow-Headers'] = '*'
    headers['Access-Control-Max-Age'] = '1728000'
    render text: '', content_type: 'text/plain'
  end
end
