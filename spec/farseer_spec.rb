# frozen_string_literal: true

RSpec.describe Farseer do
  describe '#char_parser' do
    specify do
      char = 'a'
      input = 'ab'
      rest = 'b'
      result = described_class.char_parser.call(char, input).value!
      expected = described_class::Result.new(char, rest)

      expect(result).to eq(expected)
    end

    specify do
      char = 'a'
      input = 'bb'
      rest = 'bb'
      result = described_class.char_parser.call(char, input)

      expect(result).to be_none
    end
  end
end
