# frozen_string_literal: true

module Farseer
  class Opt
    def initialize(parser)
      @parser = parser
      freeze
    end

    def parse(input)
      @parser.parse(input)
             .map_none { Result.new('', input) }
    end
  end
end
