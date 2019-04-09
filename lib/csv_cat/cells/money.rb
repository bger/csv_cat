module CsvCat
  module Cells
    class Money < Cells::Base
      def render
        formatted.rjust(target_width, ' ')
      end

      def length
        formatted.length
      end

      def word
        ('%.2f' % @word.to_f.ceil(2)).to_s
      end

      private

      def formatted
        @formatted ||= begin
          left, right = word.split('.')
          left_formatted = left.reverse.gsub(/\d\d\d(?=.)/,'\& ').reverse
          [left_formatted, right].join(',')
        end
      end
    end
  end
end
