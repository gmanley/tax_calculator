require 'bigdecimal'

module TaxCalculator
  class InputParser
    class InvalidInput < Error; end

    LINE_PATTERN = /^(?<item_count>\d+) (?<item_name>.+) at (?<price>\d+\.\d{2})$/

    def initialize(file_contents)
      @file_contents = file_contents
    end

    def parse
      @file_contents.split("\n").map.with_index do |line, i|
        parse_line(line, line_number: i + 1)
      end
    end

    private

    def parse_line(line, line_number:)
      line_match = LINE_PATTERN.match(line)
      if line_match
        LineItem.new(
          count: Integer(line_match[:item_count]),
          item_name: line_match[:item_name],
          price: BigDecimal(line_match[:price]),
        )
      else
        raise InvalidInput, "Line #{line_number} of file is invalid."
      end
    end
  end
end
