# frozen_string_literal: true

RSpec.describe Farseer do
  describe '#char_parser' do
    specify do
      char = 'a'
      result = described_class.char_parser.call(char, 'ab').value!
      expected = described_class::Result.new(char, 'b')

      expect(result).to eq(expected)
    end

    specify do
      char = 'a'
      input = 'bb'
      result = described_class.char_parser.call(char, input)

      expect(result).to be_none
    end
  end
end
