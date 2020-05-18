# frozen_string_literal: true

# Authenticable provides helpers for establishing the current user.
module Authenticable
  def current_user
    @current_user ||= User.find_by(id: decoded_token&.dig(:user_id)) || User.new
  end

  protected

  def authenticate_user
    unauthorized if !current_user.persisted?
  end

  private

  def auth_header
    request.headers['Authorization']
  end

  def decoded_token
    pattern = /^Bearer /
    return unless auth_header.present? && auth_header.match(pattern)

    token = auth_header.gsub(pattern, '')

    JsonWebToken.decode(token)
  end
end
