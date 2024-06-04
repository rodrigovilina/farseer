# frozen_string_literal: true

RSpec.describe Farseer::Word do
  describe '.new' do
    it 'freezes the instance' do
      parser = described_class.new('a')

      expect(parser).to be_frozen
    end
  end

  describe '#parse' do
    specify do
      word = 'ab'
      result = described_class.new(word).parse('abcd').value!
      expected = Result.new(word, 'cd')

      expect(result).to eq(expected)
    end

    specify do
      word = 'a'
      input = 'bb'
      result = described_class.new(word).parse(input)

      expect(result).to be_none
    end
  end
end
