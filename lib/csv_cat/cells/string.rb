module CsvCat
  module Cells
    class String < Cells::Base
      def render
        word.ljust(target_width, ' ')
      end

      def length
        word.length
      end
    end
  end
end
