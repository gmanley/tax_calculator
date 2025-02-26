require 'spec_helper'

RSpec.describe TaxCalculator::InputParser do
  describe '#parse' do
    subject(:result) { described_class.new(file_contents).parse }


    context 'when input is invalid' do
      let(:file_contents) do
        <<~END
          3 chocolate bars at 4.87
          4
        END
      end

      it 'raises an error indicating which line is invalid' do
        expect { result }.to raise_error(TaxCalculator::InputParser::InvalidInput, 'Line 2 of file is invalid.')
      end
    end

    context 'when input is valid' do
      let(:file_contents) do
        <<~END
          3 chocolate bars at 4.87
          4 roses at 9.43
        END
      end


      it 'returns an array of parsed objects for each input line' do
        expect(result.length).to eq(2)
      end

      it 'parses line item count into integer' do
        expect(result.first.count).to eq(3)
      end

      it 'parses line item name' do
        expect(result.first.item_name).to eq('chocolate bars')
      end

      it 'parses line item price into BigDecimal' do
        expect(result.first.unit_price).to eq(BigDecimal('4.87'))
      end
    end
  end
end
