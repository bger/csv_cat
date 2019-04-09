module CsvCat
  # Responsible for rendering data into given stream
  #
  class Printer
    attr_reader :stdout, :data_stream, :stdin, :widths, :show_by

    def initialize(parser:, stdout: $stdout, stdin: $stdin, show_by: 3)
      @data_stream = parser.content
      @widths      = parser.widths
      @stdout      = stdout
      @stdin       = stdin
      @show_by     = show_by
    end

    def print
      stdout.puts(cover)

      data_stream.each_slice(show_by) do |sections|
        render = sections.map {|section| section.render.append(horizontal_line) }

        stdout.puts(render)

        stdin.getch
      end
    end

    private

    def horizontal_line
      @horizontal_line ||= "+#{line_bulkheads.join('+')}+"
    end

    def cover
      @cover ||= "+#{line_bulkheads.join('-')}+"
    end

    def line_bulkheads
      @line_bulkheads ||= widths.map {|width| '-' * width}
    end
  end
end
