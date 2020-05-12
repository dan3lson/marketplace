# frozen_string_literal: true

# Utility service to handle the logic for encoding and decoding a JWT token.
class JsonWebToken
  class << self
    def encode(payload)
      JWT.encode(payload, secret_key_base)
    end

    def decode(payload)
      HashWithIndifferentAccess.new(JWT.decode(payload, secret_key_base)[0])
    rescue JWT::DecodeError => e
      Rails.logger.error "JsonWebToken#decode error: #{e}"
      nil
    end

    private

    def secret_key_base
      ENV.fetch('SECRET_KEY_BASE') { Rails.application.credentials.secret_key_base }
    end
  end
end
