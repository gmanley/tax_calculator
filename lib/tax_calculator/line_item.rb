module TaxCalculator
  class LineItem
    # Clearly extremely limited matchers for these categories.
    FOOD_MATCHERS = [
      /\bchocolate(s?)\b/,
      /\bapple(s?)\b/
    ]

    MEDICAL_MATCHERS = [
      /\bpill(s?)\b/,
      /\binsulin\b/
    ]

    BOOK_MATCHERS = [
      /\bbook(s?)/
    ]

    attr_reader :count, :item_name, :price

    def initialize(count:, item_name:, price:)
      @count = count
      @item_name = item_name
      @price = price
    end

    def type
      if food?
        'food'
      elsif medical?
        'medical'
      elsif book?
        'book'
      else
        'other'
      end
    end

    def other_type?
      !(food? || medical? || book?)
    end

    def food?
      @is_food ||= FOOD_MATCHERS.any? { |m| m.match?(item_name) }
    end

    def medical?
      @is_medical ||= MEDICAL_MATCHERS.any? { |m| m.match?(item_name) }
    end

    def book?
      @is_book ||= BOOK_MATCHERS.any? { |m| m.match?(item_name) }
    end
  end
end