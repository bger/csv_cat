module CsvCat
  class CellsFactory
    CELLS = {
      'int' => CsvCat::Cells::Number,
      'money' => CsvCat::Cells::Money,
      'string' => CsvCat::Cells::String,
      'empty' => CsvCat::Cells::Empty
    }

    def self.create(type: , word: '', target_width: 0)
      CELLS[type.to_s].new(word: word, target_width: target_width)
    end
  end
end
