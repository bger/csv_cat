require 'spec_helper'

RSpec.describe CsvCat::Cells::Empty do
  subject(:cell) { described_class.new(target_width: 3) }

  describe 'render' do
    it 'returns string representation of cell' do
      expect(cell.render).to eq('   ')
    end
  end
end
