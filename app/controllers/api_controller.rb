# frozen_string_literal: true

# ApiController
class ApiController < ActionController::API
  # Catch Active Record Errors/Exceptions
  rescue_from ActiveRecord::RecordInvalid do |e|
    bad_request(e&.record.nil? ? e.message : e.record.errors)
  end

  # Catch Invalid Statement Errors/Exceptions
  rescue_from ActiveRecord::StatementInvalid do |e|
    bad_request(e&.record.nil? ? e.message : e.record.errors)
  end

  # Catch ActiveRecord Not Found Exceptions
  rescue_from ActiveRecord::RecordNotFound do |e|
    not_found(e)
  end

  def bad_request(errors = nil)
    render_api_response(body: errors || { error: 'Invalid request' }, code: 400)
  end

  def unauthorized(errors = nil)
    render_api_response(body: errors || { error: 'Unauthorized request credentials' }, code: 401)
  end

  def not_found(errors = nil)
    render_api_response(body: errors || { error: 'Specified resource not found' }, code: 404)
  end

  def internal_error(errors)
    render_api_response(body: errors || { error: 'Unhandled internal server error' }, code: 500)
  end

  def success(body: nil, code: 200)
    render_api_response(body: body, code: code)
  end

  private

  def render_api_response(body: nil, code:)
    render json: body, status: code
  end
end
