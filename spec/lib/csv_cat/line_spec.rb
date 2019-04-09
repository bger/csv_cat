require 'spec_helper'

RSpec.describe CsvCat::Line do
  subject(:line) { described_class.new(cells) }
  let(:cells) { 3.times.map { instance_double(CsvCat::Cells::Base, render: 'cell') }}

  describe '#render' do
    it 'returns rendered cells' do
      expect(line.render).to eq('|cell|cell|cell|')
    end
  end

  describe '#cells' do
    it 'returns collection of cells' do
      expect(line.cells).to match_array(cells)
    end
  end
end
