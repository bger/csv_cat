require 'spec_helper'

RSpec.describe CsvCat::Printer do
  subject(:printer) { described_class.new(parser: parser, stdout: stdout, stdin: stdin) }

  let(:file_path) { File.expand_path('spec/fixtures/test.csv') }
  let(:parser) { CsvCat::Parser.new(file_path) }

  let(:stdout) { StringIO.new }
  let(:stdin) { StringIO.new }


  describe '#print' do
    it 'renders parsed ASCII table to given stream' do
      printer.print
      stdout.rewind

      expect(stdout.lines.to_a).to match_array(
        [
          "+------------------+\n",
          "|139|pkc|964 344,45|\n",
          "|   |wls|          |\n",
          "|   |fiz|          |\n",
          "+---+---+----------+\n",
          "|808|vwh|470 809,45|\n",
          "|   |xcf|          |\n",
          "|   |zgo|          |\n",
          "+---+---+----------+\n",
          "| 44|ato|236 159,45|\n",
          "|   |lin|          |\n",
          "|   |wgx|          |\n",
          "+---+---+----------+\n",
          "|522|dan|624 910,45|\n",
          "|   |yhv|          |\n",
          "|   |xug|          |\n",
          "+---+---+----------+\n",
          "|525|odb| 92 547,45|\n",
          "|   |plq|          |\n",
          "|   |uis|          |\n",
          "+---+---+----------+\n"
      ])
    end
  end
end
