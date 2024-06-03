# frozen_string_literal: true

module Farseer
  class Chars
    def initialize(chars)
      @chars = chars
      freeze
    end

    def parse(input)
      if @chars.any? { |char| char == input[0] }
        Maybe.return(Result.new(input[0], input[1..]))
      else
        Maybe.none
      end
    end
  end
end
