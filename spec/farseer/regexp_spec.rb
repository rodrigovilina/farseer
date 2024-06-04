# frozen_string_literal: true

RSpec.describe Farseer::Regexp do
  describe '.new' do
    context 'when given a regexp without `token` and `rest` capture groups' do
      it 'raises an error' do
        expect { described_class.new(//) }
          .to raise_error(described_class::RegexpError)
      end
    end

    it 'freezes the instance and saves the regexp', :aggregate_failures do
      regexp = /(?'token'.*)(?'rest'.*)/
      parser = described_class.new(regexp)
      expect(parser).to be_frozen
    end
  end

  describe '#parse' do
    specify do
      result = described_class.new(described_class::WS_REGEXP).parse(' a').value!
      expected = Result.new(' ', 'a')

      expect(result).to eq(expected)
    end
  end
end
