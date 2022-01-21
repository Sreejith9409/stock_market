class ApplicationController < ActionController::API
  include ApplicationMethods

  before_action :configure_permitted_parameters, if: :devise_controller?

  def authenticate_user!(options = {})
    head :unauthorized unless signed_in?
  end

  def current_user
    @current_user ||= super || User.find(@current_user_id)
  end

  def signed_in?
    @current_user_id.present?
  end

  private

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: %i[email mobile username])
    devise_parameter_sanitizer.permit(:sign_in, keys: %i[email password])
  end

end
