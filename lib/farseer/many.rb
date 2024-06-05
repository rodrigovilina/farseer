# frozen_string_literal: true

module Farseer
  class Many
    include MapFactory

    def initialize(parser)
      @parser = parser
      freeze
    end

    def parse(input)
      @parser.parse(input)
             .bind { |r| helper(r.rest, r.token) }
    end

    def helper(input, tokens)
      parse(input)
        .bind { |r| helper(r.rest, tokens + r.token) }
        .map_none { Result.new(tokens, input) }
    end
  end
end
