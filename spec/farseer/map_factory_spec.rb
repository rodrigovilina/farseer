# frozen_string_literal: true

RSpec.describe Farseer::MapFactory do
  describe '#map' do
    specify do
      result = Farseer::Chars::DIGITS.map { Integer(_1, 10) }.parse('1b').value!
      expected = Result.new(1, 'b')

      expect(result).to eq(expected)
    end
  end
end
