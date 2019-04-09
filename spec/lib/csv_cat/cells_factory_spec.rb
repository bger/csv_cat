require 'spec_helper'

RSpec.describe CsvCat::CellsFactory do
  subject(:factory) { described_class }

  describe '.create' do
    it 'returns object of the matched class' do
      {
        'int' => CsvCat::Cells::Number,
        'money' => CsvCat::Cells::Money,
        'string' => CsvCat::Cells::String,
        'empty' => CsvCat::Cells::Empty
      }.each do |type, cell|
        expect(factory.create(type: type, word: '', target_width: 1)).to be_instance_of(cell)
      end
    end

    it 'properly sets attributes' do
      expect(factory.create(type: :int, word: '', target_width: 1)).to have_attributes(word: '', target_width: 1)
    end
  end
end
