module ApplicationMethods
  extend ActiveSupport::Concern

  included do
    before_action :authenticate_user!
    around_action :handle_exceptions
  end

  private

  # Catch exception and return JSON-formatted error
  def handle_exceptions
    begin
      yield
    rescue ActiveRecord::RecordNotFound => exception
      @status = 404
    rescue ActiveRecord::RecordInvalid => exception
      render_unprocessable_entity_response(exception.record) && return
    rescue ArgumentError => exception
      track_error(exception)
      @status = 400
    rescue StandardError => exception
      track_error(exception)
      @status = 500
    end
    detail = { detail: exception.try(:message) }
    detail[:trace] = exception.try(:backtrace) if Rails.env.development?
    json_response({ success: false, message: exception.class.to_s, errors: [detail] }, @status) unless exception.instance_of?(NilClass)
  end

  def render_unprocessable_entity_response(resource)
    json_response({
      success: false, message: 'Validation failed', errors: resource.errors.full_messages.join(" ,")
    }, 422)
  end

  def render_unprocessable_entity(message)
    json_response({ success: false, errors: message }, 422) && (return true)
  end

  def render_success_response(resources = {}, message = "", status = 200)
    json_response({ success: true, message: message, data: resources}, status)
  end

  def render_failure_response(message = '', status = 200)
    json_response({ success: false, errors: message }, status)
  end

  def json_response(options = {}, status = 500)
    render json: JsonResponse.new(options), status: status
  end

  def render_unauthorized_response
    json_response({
                    success: false,
                    message: 'You are not authorized.'
                  }, 401) && return
  end

  def track_error(exception)
    log_and_report(exception, {
      params: params.try(:to_json), request_body: request.try(:body).try(:to_json),
      current_user_id: current_user.try(:id)
    }, "api")
  end

  def array_serializer
    ActiveModel::Serializer::CollectionSerializer
  end

  def single_serializer
    ActiveModelSerializers::SerializableResource
  end
end
