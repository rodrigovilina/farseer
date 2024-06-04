# frozen_string_literal: true

RSpec.describe Farseer::Char do
  describe '.new' do
    it 'freezes the instance' do
      parser = described_class.new('a')

      expect(parser).to be_frozen
    end
  end

  describe '#parse' do
    specify do
      char = 'a'
      result = described_class.new(char).parse('ab').value!
      expected = Result.new(char, 'b')

      expect(result).to eq(expected)
    end

    specify do
      char = 'a'
      input = 'bb'
      result = described_class.new(char).parse(input)

      expect(result).to be_none
    end
  end
end
