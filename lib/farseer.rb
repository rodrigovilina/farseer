# frozen_string_literal: true

require 'muina'
require 'zeitwerk'
loader = Zeitwerk::Loader::for_gem
loader.setup

module Farseer
  WS_REGEX = /^(\s*)(.*)$/
  Maybe = Muina::Maybe

  def self.any_char_parser
    ->(chars, input) { Chars.new(chars).parse(input) }
      .curry
  end

  def self.char_parser
    ->(char, input) { Char.new(char).parse(input) }
      .curry
  end

  def self.ws_parser
    ->(input) {
      match = input.match(WS_REGEX)

      Maybe.return(Result.new(match[1], match[2]))
    }
  end
end

loader.eager_load
