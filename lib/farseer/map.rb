# frozen_string_literal: true

module Farseer
  class Map
    include MapFactory

    def initialize(parser, &map)
      @parser = parser
      @map = map
      freeze
    end

    def parse(input)
      @parser.parse(input).map { |r| Result.new(@map.call(r.token), r.rest) }
    end
  end
end
