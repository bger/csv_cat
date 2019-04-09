module CsvCat
  module Cells
    class Number < Cells::Base
      def render
        word.rjust(target_width, ' ')
      end

      def length
        word.length
      end
    end
  end
end
