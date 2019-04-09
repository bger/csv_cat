module CsvCat
  class Table
    attr_reader :printer

    # @params file_path [String]
    #
    def initialize(file_path)
      @file = File.open(file_path)
    end

    # Prints ASCII table based on data from given file
    #
    def print
      printer = CsvCat::Printer.new(
        parser: CsvCat::Parser.new(file)
      )

      printer.print
    end

    private

    attr_reader :file
  end
end
