module TaxCalculator
  class Error < StandardError; end
end

require_relative 'tax_calculator/line_item'
require_relative 'tax_calculator/input_parser'
require_relative 'tax_calculator/cli'
