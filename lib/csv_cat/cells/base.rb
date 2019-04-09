module CsvCat
  class Cells::Base
    attr_reader :word, :target_width

    def initialize(word: '', target_width: 0)
      @target_width = target_width
      @word = word
    end

    def render
      raise NotImplementedError
    end
  end
end
