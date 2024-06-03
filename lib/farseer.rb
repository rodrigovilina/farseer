# frozen_string_literal: true

require 'muina'
require 'zeitwerk'
loader = Zeitwerk::Loader::for_gem
loader.setup

module Farseer
  Maybe = Muina::Maybe

  module_function

  def char_parser
    ->(char, input) { Farseer.char_parser_helper(char, input) }.curry
  end

  def char_parser_helper(char, input)
    case input[0]
    when char then Maybe.return(Result.new(input[0], input[1..]))
    else Maybe.none
    end
  end
end

loader.eager_load
