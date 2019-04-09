module CsvCat
  class Line
    attr_reader :cells

    def initialize(cells)
      @cells = cells
    end

    def render
      rendered_cells = cells.map(&:render).join("|")

      "|#{rendered_cells}|"
    end
  end
end
