# frozen_string_literal: true

module Farseer
  class Empty
    include MapFactory

    def initialize
      freeze
    end

    def parse(input)
      Maybe.return Result.new('', input)
    end
  end
end
