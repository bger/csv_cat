module CsvCat
  module Cells
    class Empty < Cells::Base
      # def initialize(target_width:, word: '')
      #   super
      # end

      def render
        word.ljust(target_width, ' ')
      end
    end
  end
end
