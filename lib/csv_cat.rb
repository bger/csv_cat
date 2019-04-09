require 'pry'
require 'csv'
require 'io/console'

module CsvCat
  module Cells
    autoload :Base, 'csv_cat/cells/base'
    autoload :Number, 'csv_cat/cells/number'
    autoload :String, 'csv_cat/cells/string'
    autoload :Money, 'csv_cat/cells/money'
    autoload :Empty, 'csv_cat/cells/empty'
  end

  autoload :CellsFactory, 'csv_cat/cells_factory'
  autoload :Parser, 'csv_cat/parser'
  autoload :Section, 'csv_cat/section'
  autoload :Line, 'csv_cat/line'
  autoload :Printer, 'csv_cat/printer'
  autoload :Box, 'csv_cat/box'
  autoload :Metadata, 'csv_cat/metadata'
  autoload :Table, 'csv_cat/table'
end
