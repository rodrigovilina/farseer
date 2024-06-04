# frozen_string_literal: true

module Farseer
  class Any
    def initialize(parser)
      @parser = parser
      freeze
    end

    def parse(input)
      helper(input, '')
    end

    def helper(input, tokens)
      @parser.parse(input)
             .bind { |r| helper(r.rest, tokens + r.token) }
             .map_none { Result.new(tokens, input) }
    end
  end
end
