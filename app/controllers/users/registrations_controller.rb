class Users::RegistrationsController < Devise::RegistrationsController
  respond_to :json

  skip_before_action :authenticate_user!
  skip_around_action :handle_exceptions

  private

    def respond_with(resource, _opts = {})
      register_success && return if resource.persisted?

      register_failed
    end

    def register_success
      render json: {
        status: {code: 200, message: 'Logged in successfully.'},
        data: UserSerializer.new(resource).serializable_hash[:data][:attributes]
      }
    end

    def register_failed
      render json: { message: resource.errors.full_messages.join(', ') }
    end
end
