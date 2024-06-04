# frozen_string_literal: true

RSpec.describe Farseer::Chars do
  describe '.new' do
    it 'freezes the instance' do
      parser = described_class.new(['a'])

      expect(parser).to be_frozen
    end
  end

  describe '#parse' do
    let(:chars) { ['a', 'b']   }
    let(:char)  { chars.sample }

    specify do
      input = char + 'c'
      result = described_class.new(chars).parse(input).value!
      expected = Result.new(char, 'c')

      expect(result).to eq(expected)
    end

    specify do
      input = 'cb'
      result = described_class.new(chars).parse(input)

      expect(result).to be_none
    end
  end
end
