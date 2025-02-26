module TaxCalculator
  class ReceiptFormatter
    def initialize(line_items)
      @line_items = line_items
    end

    def call
      total_tax = BigDecimal('0.0')
      total = BigDecimal('0.0')

      output = @line_items.map do |line_item|
        sales_tax = SalesTaxCalculator.new(line_item).call
        import_tax = ImportTaxCalculator.new(line_item).call
        total_line_item_tax = sales_tax + import_tax
        total_tax += total_line_item_tax
        line_item_total = line_item.total_price + total_line_item_tax
        total += line_item_total

        "#{line_item.count} #{line_item.item_name}: #{"%.2f" % line_item_total}"
      end.join("\n")

      output << "\nSales Taxes: #{"%.2f" % total_tax}\n"
      output << "Total: #{"%.2f" % total}\n"
      output
    end
  end
end
