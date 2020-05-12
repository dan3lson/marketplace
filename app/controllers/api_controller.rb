# frozen_string_literal: true

# ApiController
class ApiController < ActionController::API
  include ResponseRenderable
  include Authenticable

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
end
