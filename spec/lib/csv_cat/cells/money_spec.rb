require 'spec_helper'

RSpec.describe CsvCat::Cells::Money do
  subject(:cell) { described_class.new(word: '1234.801', target_width: 10) }

  describe "#render" do
    it 'returns rendered value' do
      expect(cell.render).to eq('  1 234,81')
    end

    describe 'value' do
      subject(:value) { described_class.new(word: '0.001', target_width: 10).render }

      it 'is rounded to two digits' do
        expect(value.split(',').last.length).to eq(2)
      end

      it 'is rounded to the top' do
        expect(value).to eq('      0,01')
      end
    end
  end

  describe '#length' do
    it 'returns length of the formatted value' do
      expect(cell.length).to eq(8)
    end
  end
end
