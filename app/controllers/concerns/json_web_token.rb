class JsonWebToken
  class << self
    def encode(payload, exp = 2.days.from_now)
      payload[:exp] = exp.to_i
      JWT.encode(payload, ENV['JWT_SECRET'])
    end
    def decode(token)
      body = JWT.decode(token, ENV['JWT_SECRET'])[0]
      HashWithIndifferentAccess.new body
      rescue JWT::ExpiredSignature, JWT::VerificationError => e
        raise ExceptionHandler::ExpiredSignature, e.message
      rescue JWT::DecodeError, JWT::VerificationError => e
        raise ExceptionHandler::DecodeError, e.message
    end
  end
end
