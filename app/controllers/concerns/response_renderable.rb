# frozen_string_literal: true

# ResponseRenderable provides helpers to render JSON API responses.
module ResponseRenderable
  def bad_request(errors = nil)
    body = errors || error(message: 'Invalid request')

    render_api_response(body: body, code: 400)
  end

  def unauthorized(errors = nil)
    body = errors || error(message: 'Unauthorized request credentials')

    render_api_response(body: body, code: 401)
  end

  def not_found(errors = nil)
    body = errors || error(message: 'Specified resource not found')

    render_api_response(body: body, code: 404)
  end

  def internal_error(errors)
    body = errors || error(message: 'Unhandled internal server error')

    render_api_response(body: body, code: 500)
  end

  def success(body: nil, code: 200)
    render_api_response(body: body, code: code)
  end

  private

  def error(message:)
    { error: message }
  end

  def render_api_response(body: nil, code:)
    render json: body, status: code
  end
end
