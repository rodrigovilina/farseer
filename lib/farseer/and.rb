# frozen_string_literal: true

module Farseer
  class And
    include MapFactory

    def initialize(*parsers)
      @parsers = parsers.flatten
      freeze
    end

    def parse(input)
      return Maybe.none if @parsers.empty?

      initial = Maybe.return(Result.new('', input))

      @parsers.reduce(initial) do |maybe_acc, parser|
        bind_accumulator(maybe_acc, parser)
      end
    end

    def bind_accumulator(maybe_acc, parser)
      maybe_acc.bind do |acc_result|
        parse_with_rest(parser, acc_result)
      end
    end

    def parse_with_rest(parser, acc_result)
      parser.parse(acc_result.rest).bind do |result|
        combine_results(acc_result, result)
      end
    end

    def combine_results(acc_result, result)
      combined_tokens = acc_result.token + result.token
      Maybe.return(Result.new(combined_tokens, result.rest))
    end
  end
end
