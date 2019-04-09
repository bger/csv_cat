module CsvCat
  class Metadata
    attr_reader :file

    # @param file [File]
    #
    def initialize(file)
      @file = file
    end

    def widths
      @widths ||= row_widths.map do |word, type|
        CsvCat::CellsFactory.create(type: type, word: word).length
      end
    end

    private

    def row_widths
      each_row.each_with_object([]) do |row, widths|
        row.each_with_index do |(type, value), idx|
          longest_word = value.split(' ').max_by(&:length)

          currently_longest_word, _type = widths[idx] || ['', type]

          if longest_word.length > currently_longest_word.length
            widths[idx] = [longest_word, type]
          end
        end
      end
    end

    def each_row
      return to_enum(:each_row) unless block_given?
      CSV.foreach(file, headers: true, col_sep: ';') { |row| yield(row) }
    end
  end
end
