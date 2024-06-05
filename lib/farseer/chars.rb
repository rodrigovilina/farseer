# frozen_string_literal: true

module Farseer
  class Chars
    include MapFactory

    def initialize(*chars)
      @chars = chars.flatten
      freeze
    end

    DIGITS        = new(('0'..'9').to_a)
    BASIC_MATH_OP = new(['+', '-', '*', '/'])

    def parse(input)
      case input[0]
      when *@chars then Maybe.return(Result.new(input[0], input[1..]))
      else Maybe.none
      end
    end
  end
end
