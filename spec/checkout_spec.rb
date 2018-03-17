require_relative '../checkout'

RSpec.describe Checkout do
  let(:special_calculation_rule) do
    instance_double(SpecialCalculationRule, cost: cost)
  end

  let(:cost) { 50 }

  let(:rules) { { A: special_calculation_rule } }

  subject { described_class.new(rules) }

  describe '#scan' do
    context 'when the product already added' do
      before { subject.scan('A') }

      it 'increments the product count' do
        subject.scan('A')
        expect(subject.instance_variable_get(:@products)[:A]).to eq 2
      end
    end

    context 'when the product is new' do
      it 'adds a new product to the hash' do
        subject.scan('A')
        expect(subject.instance_variable_get(:@products)[:A]).to eq 1
      end
    end
  end

  describe '#total' do
    before { subject.scan(product_name) }

    context 'when a product_name is empty' do
      let(:product_name) { '' }

      it 'returns 0' do
        expect(subject.total).to eq 0
      end
    end

    context 'when a product_name is not found in a price list' do
      let(:product_name) { 'X' }

      it 'raises an error' do
        expect{ subject.total }
          .to raise_error(RuntimeError, "The product: X was not found in the price list")
      end
    end

    context 'when a product name is in a price list' do
      let(:product_name) { 'A' }

      it 'returns a total price' do
        expect(subject.total).to eq cost
      end
    end
  end
end
