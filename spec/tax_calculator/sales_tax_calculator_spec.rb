require 'spec_helper'

RSpec.describe TaxCalculator::SalesTaxCalculator do
  describe '#call' do
    subject(:result) do
      described_class.new(line_item).call
    end

    context 'when item type is book' do
      let(:line_item) { double(total_price: BigDecimal('14.46'), type: 'book') }

      specify { expect(result.to_f).to eq(0.0) }
    end

    context 'when item type is medical' do
      let(:line_item) { double(total_price: BigDecimal('14.46'), type: 'medical') }

      specify { expect(result.to_f).to eq(0.0) }
    end

    context 'when item type is food' do
      let(:line_item) { double(total_price: BigDecimal('14.46'), type: 'food') }

      specify { expect(result.to_f).to eq(0.0) }
    end

    context 'when item type is other' do
      let(:line_item) { double(total_price: BigDecimal('14.46'), type: 'other') }

      it 'returns 10 percent of price rounded up to nearest 0.05' do
        expect(result.to_f).to eq(1.45)
      end
    end
  end
end
