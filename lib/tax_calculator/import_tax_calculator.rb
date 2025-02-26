module TaxCalculator
  class ImportTaxCalculator
    TAX_RATE = 5

    def initialize(line_item)
      @line_item = line_item
    end

    def call
      if @line_item.import?
        round_up_to_nearest_5_cents(@line_item.total_price * TAX_RATE / 100)
      else
        BigDecimal('0.0')
      end
    end

    private

    def round_up_to_nearest_5_cents(value)
      (value * 20).ceil / 20.00
    end
  end
end
