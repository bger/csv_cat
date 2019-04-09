module CsvCat
  class Parser
    attr_reader :file

    def initialize(file)
      @file      = file
      @metadata  = CsvCat::Metadata.new(file)
    end

    def widths
      @metadata.widths
    end

    def content
      return to_enum(:content) unless block_given?

      CSV.foreach(file, headers: true, col_sep: ';') do |row|
        boxes = row.map.with_index do |(type,value), idx|
          Box.new(value: value, type: type, width: widths[idx])
        end

        yield Section.new(boxes)
      end
    end
  end
end
