# frozen_string_literal: true

module Farseer
  class Char
    include MapFactory

    def initialize(char)
      @char = char
      freeze
    end

    L_PARENS = new('(')
    R_PARENS = new(')')
    PLUS     = new('+')
    MINUS    = new('-')
    STAR     = new('*')
    SLASH    = new('/')

    def parse(input)
      case input[0]
      when @char then Maybe.return(Result.new(input[0], input[1..]))
      else Maybe.none
      end
    end
  end
end
