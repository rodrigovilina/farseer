# frozen_string_literal: true

RSpec.describe Farseer::Many do
  describe '#parse' do
    specify do
      input = "ab"
      parser = described_class.new(Farseer::Char.new('b'))

      expect(parser.parse(input)).to eq Farseer::Maybe.none
    end

    specify do
      input = "ab"
      parser = described_class.new(Farseer::Char.new('a'))

      expect(parser.parse(input)).to eq Farseer::Maybe.return(Farseer::Result.new('a', 'b'))
    end

    specify do
      input = "aa"
      parser = described_class.new(Farseer::Char.new('a'))

      expect(parser.parse(input)).to eq Farseer::Maybe.return(Farseer::Result.new('aa', ''))
    end
  end
end
