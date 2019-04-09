require 'spec_helper'

RSpec.describe CsvCat::Cells::String do
  subject(:cell) { described_class.new(word: 'abc', target_width: 5) }

  describe "#render" do
    context 'when value less then target width' do
      subject(:short_cell) { described_class.new(word: 'abc', target_width: 5) }

      it 'added extra spaces' do
        expect(short_cell.render).to eq('abc  ')
      end

      it 'aligns value to the left' do
        expect(short_cell.render).to match /^([a-zA-Z]+)(\s+)/
      end
    end
  end
end
