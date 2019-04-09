require 'spec_helper'

RSpec.describe CsvCat::Cells::Number do
  subject(:cell) { described_class.new(word: value, target_width: 5) }
  let(:value) { '123' }

  describe '#render' do
    context 'when width is more then value length' do
      subject(:cell) { described_class.new(word: '123', target_width: 5) }

      it 'added spaces to result' do
        expect(cell.render).to eq('  123')
      end

      it 'aligns value to right side' do
        expect(cell.render).to match /^(\s+)(\d+)/
      end
    end
  end
end
