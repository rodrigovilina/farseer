# frozen_string_literal: true

module Farseer
  class Or
    include MapFactory

    def initialize(*parsers)
      @parsers = parsers.flatten
      freeze
    end

    def parse(input)
      case @parsers.length
      when 0 then Maybe.none
      when 1 then @parsers.first.parse(input)
      else parse_helper(input)
      end
    end

    def parse_helper(input)
      @parsers.reduce do |acc, parser|
        acc.parse(input).bind_none { parser.parse(input) }
      end
    end
  end
end
