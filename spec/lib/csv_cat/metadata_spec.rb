require 'spec_helper'

RSpec.describe CsvCat::Metadata do
  subject(:metadata) { described_class.new(path) }
  let(:path) { File.expand_path('spec/fixtures/test.csv') }

  describe '#widths' do
    it 'returns collection of columns widths' do
      expect(subject.widths).to match_array([
        3, 3, 10
      ])
    end
  end
end
