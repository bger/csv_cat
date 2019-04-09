module CsvCat
  # Represents one entire section for rendering
  #
  # |   139|pkcdf   |964 344,45|
  # |      |wls     |          |
  # |      |fiz     |          |
  #
  class Section
    attr_reader :boxes

    # @param boxes [Array<Box>] raw line
    #
    def initialize(boxes)
      @boxes = boxes
    end

    # Returns collection of lines present in section
    #
    # @return lines [Array<Line>]
    #
    def lines
      plain_lines = boxes.map do |box|
        box.align_to(box_max_height)
      end.transpose

      plain_lines.map { |set| Line.new(set) }
    end

    def render
      lines.map(&:render)
    end

    private

    def box_max_height
      boxes.map(&:height).max
    end
  end
end
