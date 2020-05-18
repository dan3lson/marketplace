# frozen_string_literal: true

# ApiController
class ApiController < ActionController::API
  include ResponseRenderable
  include Authenticable
  include Pundit

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

  # Catch Pundit Unauthorized Exceptions
  rescue_from Pundit::NotAuthorizedError do |e|
    unauthorized
  end
end
