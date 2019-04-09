module CsvCat
  # Represents a group of cells in a column
  #
  # +----+
  # |abc |
  # |def |
  # |    |
  # |    |
  # +----+
  #
  # @example
  #   box = Box.new(value: 'abc def', type: 'string')
  #   box.align_to(4)
  #
  class Box
    attr_reader :value, :type, :width

    # @param value [String] - value from the file
    # @param type [String] cell type
    # @param width [Integer]
    #
    def initialize(value:, type:, width:)
      @value = value
      @width = width
      @type  = type
    end

    # Returns aligned to a given height collection of cells
    #
    # @param target_height [Integer] target count of cells in the collection
    #
    # @return [Array<Cell>]
    #
    def align_to(target_height)
      missing_cells_count = target_height - height
      [
        *cells,
        *empty_cells(missing_cells_count)
      ]
    end

    # Returns height of the original collection without alignment
    #
    # @return [Integer]
    #
    def height
      @height ||= words.count
    end

    private

    def cells
      @cells ||= words.map { |word| CellsFactory.create(type: type, word: word, target_width: width) }
    end

    def empty_cells(count)
      Array.new(count) { CellsFactory.create(type: :empty, target_width: width) }
    end

    def words
      @words ||= value.split(' ')
    end
  end
end
