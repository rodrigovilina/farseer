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
        self.token.eql?(other.token) and
        self.rest.eql?(other.rest)
    end
    alias == eql?
  end
end
