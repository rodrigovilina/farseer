# frozen_string_literal: true

require 'muina'
require 'zeitwerk'
loader = Zeitwerk::Loader::for_gem
loader.setup

module Farseer
  WS_REGEX = /^(\s*)(.*)$/
  Maybe = Muina::Maybe

  module_function

  def char_parser
    ->(char, input) { Farseer.__send__(:char_parser_helper, char, input) }.curry
  end

  def ws_parser
    ->(input) {
      match = input.match(WS_REGEX)

      Maybe.return(Result.new(match[1], match[2]))
    }
  end

  def char_parser_helper(char, input)
    case input[0]
    when char then Maybe.return(Result.new(input[0], input[1..]))
    else Maybe.none
    end
  end
  private :char_parser_helper
end

loader.eager_load
