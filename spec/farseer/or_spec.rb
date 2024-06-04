# frozen_string_literal: true

RSpec.describe Farseer::Or do
  describe '.new' do
    it 'freezes the instance' do
      parser = described_class.new(Farseer::Char::PLUS)

      expect(parser).to be_frozen
    end
  end

  describe '#parse' do
    specify do
      input = "ab"
      parser = described_class.new()

      expect(parser.parse(input)).to eq Maybe.none
    end

    specify do
      input = "ab"
      parser = Farseer::Char.new('a')
      parser = described_class.new(parser)

      expect(parser.parse(input)).to eq Maybe.return(Farseer::Result.new('a', 'b'))
    end

    specify do
      input = "ab"
      parser = Farseer::Char.new('a')
      parser = described_class.new([parser])

      expect(parser.parse(input)).to eq Maybe.return(Farseer::Result.new('a', 'b'))
    end

    it 'tries the parsers in sequence', :aggregate_failures do
      a_parser = Farseer::Char.new('a')
      b_parser = Farseer::Char.new('b')
      parser = described_class.new(a_parser, b_parser)

      expect(parser.parse("ab")).to eq Maybe.return(Result.new('a', 'b'))
      expect(parser.parse("bc")).to eq Maybe.return(Result.new('b', 'c'))
    end
  end
end
