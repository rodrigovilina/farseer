# frozen_string_literal: true

RSpec.describe Farseer::Map do
  describe '.new' do
    it 'freezes the instance' do
      parser = described_class.new('a')

      expect(parser).to be_frozen
    end
  end

  describe '#parse' do
    specify do
      digit_parser = Farseer::Chars::DIGITS
      result = described_class.new(digit_parser) { Integer(_1, 10) }.parse('1b').value!
      expected = Result.new(1, 'b')

      expect(result).to eq(expected)
    end
  end
end
