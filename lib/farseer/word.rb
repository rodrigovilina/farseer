# frozen_string_literal: true

module Farseer
  class Word
    include MapFactory

    def initialize(word)
      @word = word
      freeze
    end

    def parse(input)
      case
      when input.start_with?(@word) then Maybe.return(Result.new(@word, input[@word.length..]))
      else Maybe.none
      end
    end
  end
end
