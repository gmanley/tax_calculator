module TaxCalculator
  class SalesTaxCalculator
    ITEM_TYPE_EXCLUSIONS = %w[
      book
      food
      medical
    ]

    TAX_RATE = 10

    def initialize(line_item)
      @line_item = line_item
    end

    def call
      if ITEM_TYPE_EXCLUSIONS.include?(@line_item.type)
        BigDecimal('0.0')
      else
        round_up_to_nearest_5_cents(@line_item.total_price * TAX_RATE / 100)
      end
    end

    private

    def round_up_to_nearest_5_cents(value)
      (value * 20).ceil / 20.00
    end
  end
end
