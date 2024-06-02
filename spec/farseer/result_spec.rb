# frozen_string_literal: true

RSpec.describe Farseer::Result do
  describe '.new' do
    specify do
      result = described_class.new('a', 'b')
      expect(result.token).to eql('a')
      expect(result.rest).to eql('b')
      expect(result.frozen?).to be true
    end
  end

  describe '#eql?' do
    context 'when compared to other class instance' do
      specify do
        result = described_class.new('a', 'a')
        other = Object.new

        expect(result).not_to eql(other)
      end
    end

    context 'when tokens and rest are different' do
      specify do
        result = described_class.new('a', 'a')
        other = described_class.new('b', 'b') 

        expect(result).not_to eql(other)
      end
    end

    context 'when tokens are the same but rest is different' do
      specify do
        result = described_class.new('a', 'a')
        other = described_class.new('a', 'b') 

        expect(result).not_to eql(other)
      end
    end

    context 'when rest is the same but tokens are different' do
      specify do
        result = described_class.new('a', 'a')
        other = described_class.new('b', 'a') 

        expect(result).not_to eql(other)
      end
    end

    context 'when token and rest are the same' do
      specify do
        result = described_class.new('a', 'a')
        other = described_class.new('a', 'a') 

        expect(result).to eql(other)
      end
    end
  end
end
