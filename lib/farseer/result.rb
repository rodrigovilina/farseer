# frozen_string_literal: true

module Farseer
  class Result
    def initialize(token, rest)
      @token = token
      @rest = rest
      freeze
    end
    attr_reader :token, :rest

    def eql?(other)
      self.class.eql?(other.class) and
        token.eql?(other.token) and
        rest.eql?(other.rest)
    end
    alias == eql?
  end
end
