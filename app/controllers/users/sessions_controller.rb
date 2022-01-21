class Users::SessionsController < Devise::SessionsController
  respond_to :json

  skip_before_action :authenticate_user!

  private

  def respond_with(resource, _opts = {})
    render json: {
      status: {code: 200, message: 'Logged in successfully.'},
      data: UserSerializer.new(resource).serializable_hash[:data][:attributes]
    }
  end
  
  def respond_to_on_destroy
    head :ok
  end
end
