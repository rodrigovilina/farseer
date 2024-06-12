# frozen_string_literal: true

RSpec.describe Farseer::Empty do
  describe '.new' do
    it 'freezes the instance' do
      parser = described_class.new

      expect(parser).to be_frozen
    end
  end

  describe '#parse' do
    specify do
      result = described_class.new.parse('ab').value!
      expected = Result.new('', 'ab')

      expect(result).to eq(expected)
    end
  end
end
