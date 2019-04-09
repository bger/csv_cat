require 'spec_helper'

RSpec.describe CsvCat::Section do
  subject(:section) { described_class.new(boxes) }

  let(:box) {  }
  let(:boxes) do
    3.times.map do |idx|
      cell = instance_double('cell', render: idx)

      instance_double(CsvCat::Box, align_to: Array.new(3) { cell }, height: 3)
    end
  end

  describe '#lines' do
    it 'returns collection of lines' do
      expect(section.lines.count).to eq(3)
    end
  end

  describe '#render' do
    it 'returns rendered lines' do
      expect(section.render).to match_array([
        '|0|1|2|', '|0|1|2|', '|0|1|2|'
      ])
    end
  end
end
