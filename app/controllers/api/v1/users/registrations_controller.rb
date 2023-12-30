# frozen_string_literal: true

module Api
  module V1
    module Users
      # RegistrationsController
      class RegistrationsController < Devise::RegistrationsController
        def create
          user = User.new(sign_up_params)

          if user.save
            render json: { user:, message: 'Usuário registrado com sucesso', is_success:	true }, status: :ok
          else
            render json: { message: "Não foi possível criar o usuário com sucesso. #{current_user.errors.full_messages.to_sentence}", is_success: false },	status: :unprocessable_entity
          end
        end

        private

        def sign_up_params
          params.require(:user).permit(:user_name, :user_type, :email, :password, :password_confirmation)
        end
      end
    end
  end
end
