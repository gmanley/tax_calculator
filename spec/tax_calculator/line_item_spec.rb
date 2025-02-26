require 'spec_helper'

RSpec.describe TaxCalculator::LineItem do
  describe '#total_price' do
    subject(:line_item) do
      described_class.new(
        count: 5,
        unit_price: BigDecimal('1.00'),
        item_name: 'box of chocolates'
      )
    end

    it 'returns total price based on unit_price and count' do
      expect(line_item.total_price).to eq(BigDecimal('5.00'))
    end
  end

  context 'when item is a known type of food' do
    subject(:line_item) do
      described_class.new(
        count: 8,
        unit_price: BigDecimal('1.43'),
        item_name: 'box of chocolates'
      )
    end

    describe '#type' do
      specify { expect(line_item.type).to eq('food') }
    end

    describe '#food?' do
      specify { expect(line_item.food?).to eq(true) }
    end

    describe '#medical?' do
      specify { expect(line_item.medical?).to eq(false) }
    end

    describe '#book?' do
      specify { expect(line_item.book?).to eq(false) }
    end

    describe '#other_type?' do
      specify { expect(line_item.other_type?).to eq(false) }
    end
  end

  context 'when item is a known type of medical item' do
    subject(:line_item) do
      described_class.new(
        count: 8,
        unit_price: BigDecimal('1.43'),
        item_name: 'vials of insulin'
      )
    end

    describe '#type' do
      specify { expect(line_item.type).to eq('medical') }
    end

    describe '#medical?' do
      specify { expect(line_item.medical?).to eq(true) }
    end

    describe '#food?' do
      specify { expect(line_item.food?).to eq(false) }
    end

    describe '#book?' do
      specify { expect(line_item.book?).to eq(false) }
    end

    describe '#other_type?' do
      specify { expect(line_item.other_type?).to eq(false) }
    end
  end


  context 'when item is a known type of book' do
    subject(:line_item) do
      described_class.new(
        count: 8,
        unit_price: BigDecimal('1.43'),
        item_name: 'book on pandas'
      )
    end

    describe '#type' do
      specify { expect(line_item.type).to eq('book') }
    end

    describe '#book?' do
      specify { expect(line_item.book?).to eq(true) }
    end

    describe '#food?' do
      specify { expect(line_item.food?).to eq(false) }
    end

    describe '#medical?' do
      specify { expect(line_item.medical?).to eq(false) }
    end

    describe '#other_type?' do
      specify { expect(line_item.other_type?).to eq(false) }
    end
  end

  context 'when item is an unknown type' do
    subject(:line_item) do
      described_class.new(
        count: 8,
        unit_price: BigDecimal('1.43'),
        item_name: 'gaming mouse'
      )
    end

    describe '#type' do
      specify { expect(line_item.type).to eq('other') }
    end

    describe '#other_type?' do
      specify { expect(line_item.other_type?).to eq(true) }
    end

    describe '#food?' do
      specify { expect(line_item.food?).to eq(false) }
    end

    describe '#medical?' do
      specify { expect(line_item.medical?).to eq(false) }
    end

    describe '#book?' do
      specify { expect(line_item.book?).to eq(false) }
    end
  end
end
