# frozen_string_literal: true

require 'muina'
require 'zeitwerk'
loader = Zeitwerk::Loader::for_gem
loader.setup

module Farseer
  WS_REGEX = /^(\s*)(.*)$/
  Maybe = Muina::Maybe

  def self.any_char_parser
    ->(chars, input) { Farseer.__send__(:any_char_parser_helper, chars, input) }.curry
  end

  def self.char_parser
    ->(char, input) { Farseer.__send__(:char_parser_helper, char, input) }.curry
  end

  def self.ws_parser
    ->(input) {
      match = input.match(WS_REGEX)

      Maybe.return(Result.new(match[1], match[2]))
    }
  end

  private

  def self.char_parser_helper(char, input)
    case input[0]
    when char then Maybe.return(Result.new(input[0], input[1..]))
    else Maybe.none
    end
  end

  def self.any_char_parser_helper(chars, input)
    if chars.any? { |char| char == input[0]  }
      Maybe.return(Result.new(input[0], input[1..]))
    else
      Maybe.none
    end
  end
end

loader.eager_load
