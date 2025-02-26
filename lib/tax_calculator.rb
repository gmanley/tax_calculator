require 'bigdecimal'

module TaxCalculator
  class Error < StandardError; end
end

require_relative 'tax_calculator/line_item'
require_relative 'tax_calculator/input_parser'
require_relative 'tax_calculator/cli'
require_relative 'tax_calculator/sales_tax_calculator'
require_relative 'tax_calculator/import_tax_calculator'
require_relative 'tax_calculator/receipt_formatter'
