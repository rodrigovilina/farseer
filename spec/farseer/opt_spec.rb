# frozen_string_literal: true

RSpec.describe Farseer::Opt do
  describe '.new' do
    it 'freezes the instance' do
      parser = described_class.new(Farseer::Char::PLUS)

      expect(parser).to be_frozen
    end
  end

  describe '#parse' do
    specify do
      input = "ab"
      parser = described_class.new(Farseer::Char.new('a'))

      expect(parser.parse(input)).to eq Farseer::Maybe.return(Farseer::Result.new('a', 'b'))
    end

    specify do
      input = "ab"
      parser = described_class.new(Farseer::Char.new('b'))

      expect(parser.parse(input)).to eq Farseer::Maybe.return(Farseer::Result.new('', 'ab'))
    end

    specify do
      input = "aa"
      parser = described_class.new(Farseer::Char.new('a'))

      expect(parser.parse(input)).to eq Farseer::Maybe.return(Farseer::Result.new('a', 'a'))
    end
  end
end
