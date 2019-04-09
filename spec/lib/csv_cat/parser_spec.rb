require 'spec_helper'

RSpec.describe CsvCat::Parser do
  subject(:parser) { described_class.new(file) }

  let(:file) { File.open(file_path) }
  let(:file_path) { File.expand_path('spec/fixtures/simple_csv.csv') }

  describe '#widths' do
    it 'returns columns widths of given file' do
      expect(parser.widths).to match_array([3,3,6])
    end
  end


  describe '#content' do
    context 'when no block given' do
      it 'returns enumerator' do
        expect(parser.content.to_a.count).to eq(1)
      end
    end

    context 'when block is given' do
      it 'returns renderable objects' do
        expect {|b| parser.content(&b) }.to yield_control
      end
    end
  end
end

