# frozen_string_literal: true

# ApplicationController
class ApplicationController < ActionController::Base
  include Pagy::Backend
  include Pundit::Authorization

  include Analyzable
  before_action :authenticate_user!
  before_action :configure_permitted_parameters, if: :devise_controller?

  protected

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: %i[user_name email password])
    devise_parameter_sanitizer.permit(:account_update, keys: %i[user_name email password current_password])
  end
end
