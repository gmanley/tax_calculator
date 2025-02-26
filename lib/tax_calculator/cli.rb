module TaxCalculator
  class CLI
    def initialize(file_contents)
      @file_contents = file_contents
    end

    def call
      line_items = InputParser.new(file_contents).parse
      print ReceiptFormatter.new(line_items).call
    end
  end
end
