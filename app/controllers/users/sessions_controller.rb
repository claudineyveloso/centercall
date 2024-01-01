# frozen_string_literal: true

module Users
  # SessionsController
  class SessionsController < Devise::SessionsController
    include RackSessionsFix
    respond_to :json

    private

    def respond_with(_current_user, _opts = {})
      # user = User.find_for_database_authentication(email: params[:user][:email])
      # return unless user&.valid_password?(params[:user][:password])

      # sign_in(:user, user)
      # current_user = user
      # render json: {
      #   token: current_token,
      #   status: {
      #     code: 200, message: 'Logado.',
      #     data: { user: UserSerializer.new(current_user = user).serializable_hash[:data][:attributes] }
      #   }
      # }, status: :ok

      render json: {
        token: current_token,
        status: {
          code: 200, message: 'Logado.',
          data: { user: UserSerializer.new(current_user).serializable_hash[:data][:attributes] }
        }
      }, status: :ok
    end

    def current_token
      request.env['warden-jwt_auth.token']
    end

    def respond_to_on_destroy
      if request.headers['Authorization'].present?
        jwt_payload = JWT.decode(request.headers['Authorization'].split(' ').last, Rails.application.credentials.devise_jwt_secret_key!).first
        current_user = User.find(jwt_payload['sub'])
      end

      if current_user
        render json: {
          status: 200,
          message: 'Desconectado.'
        }, status: :ok
      else
        render json: {
          status: 401,
          message: 'Não foi possível encontrar uma sessão ativa.'
        }, status: :unauthorized
      end
    end
  end
end
