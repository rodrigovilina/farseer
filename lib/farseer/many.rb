# frozen_string_literal: true

module Farseer
  class Many
    def initialize(parser)
      @parser = parser
      freeze
    end

    def parse(input)
      @parser.parse(input)
             .bind { |r| helper(r.rest, [r.token]) }
    end

    def helper(input, tokens = [])
      @parser.parse(input)
             .bind { |r| helper(r.rest, [*tokens, r.token]) }
             .map_none { Result.new(tokens.join, input) }
    end
  end
end
