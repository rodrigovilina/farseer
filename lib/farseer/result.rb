# frozen_string_literal: true

module Farseer
  class Result
    def initialize(token, rest)
      @token = token
      @rest = rest
      freeze
    end
    attr_reader :token, :rest

    def ==(other)
      self.eql?(other)
    end

    def eql?(other)
      self.class.eql?(other.class) and 
        self.token.eql?(other.token) and
        self.rest.eql?(other.rest)
    end
  end
end
