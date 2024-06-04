# frozen_string_literal: true

module Farseer
  class Regexp
    WS_REGEXP = /^(?'token'\s*)(?'rest'.*)$/
    RegexpError = Class.new(ArgumentError)

    def initialize(regexp)
      raise RegexpError unless regexp.names == ['token', 'rest']

      @regexp = regexp
      freeze
    end

    WS = new(WS_REGEXP)

    def parse(input)
      match = input.match(@regexp)

      Maybe.return(Result.new(match[:token], match[:rest]))
    end
  end
end
