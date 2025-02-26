require 'spec_helper'

RSpec.describe TaxCalculator::ImportTaxCalculator do
  describe '#call' do
    subject(:result) do
      described_class.new(line_item).call
    end

    context 'when item is an import' do
      let(:line_item) { double(total_price: BigDecimal('14.46'), import?: true) }

      specify { expect(result.to_f).to eq(0.75) }
    end

    context 'when item is an import' do
      let(:line_item) { double(total_price: BigDecimal('33.75'), import?: true) }

      specify { expect(result.to_f).to eq(1.70) }
    end


    context 'when item is not an import' do
      let(:line_item) { double(total_price: BigDecimal('14.46'), import?: false) }

      specify { expect(result.to_f).to eq(0.00) }
    end
  end
end
