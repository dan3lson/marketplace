# frozen_string_literal: true

# ResponseRenderable provides helpers to render JSON API responses.
module ResponseRenderable
  def bad_request(errors = nil)
    body = errors || errors(message: 'Invalid request')

    render_api_response(body: { errors: body }, code: 400)
  end

  def unauthorized(errors = nil)
    body = errors || errors(message: 'Unauthorized credentials')

    render_api_response(body: body, code: 401)
  end

  def not_found(errors = nil)
    body = errors || errors(message: 'Specified resource not found')

    render_api_response(body: body, code: 404)
  end

  def internal_error(errors)
    body = errors || errors(message: 'Unhandled internal server error')

    render_api_response(body: body, code: 500)
  end

  def success(body: nil, code: 200)
    render_api_response(body: body, code: code)
  end

  private

  def errors(message:)
    { errors: message }
  end

  def render_api_response(body: nil, code:)
    render json: body, status: code
  end
end
