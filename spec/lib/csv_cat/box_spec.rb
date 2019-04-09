require 'spec_helper'

RSpec.describe CsvCat::Box do
  subject(:box) { described_class.new(value: 'abc def', type: 'string', width: 4) }

  describe '#align_to' do
    it 'returns array aligned to target height' do
      expect(box.align_to(3).count).to eq(3)
    end

    it 'returns array of cells' do
      expect(box.align_to(2).map(&:word)).to match_array(['abc', 'def'])
    end
  end

  describe '#height' do
    it 'returns height of the unaligned collection' do
      expect(box.height).to eq(2)
    end
  end
end
