# frozen_string_literal: true

RSpec.describe Farseer::And do
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

    context 'when successful' do
      let(:a_parser) { Farseer::Char.new('a') }
      let(:b_parser) { Farseer::Char.new('b') }

      it 'parses the input sequentially', :aggregate_failures do
        parser = described_class.new(a_parser, b_parser)

        expect(parser.parse("abc")).to eq Maybe.return(Result.new('ab', 'c'))
        expect(parser.parse("ab")).to eq Maybe.return(Result.new('ab', ''))
        expect(parser.parse("ac")).to eq Maybe.none
        expect(parser.parse("bc")).to eq Maybe.none
      end
    end
  end
end
