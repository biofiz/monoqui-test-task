require_relative '../special_calculation_rule'

RSpec.describe SpecialCalculationRule do

  subject { described_class.new(base_price, discount_amount, discount_price) }

  let(:base_price) { 100 }
  let(:discount_amount) { 3 }
  let(:discount_price) { 250 }
  let(:base_cost) { 100 }

  before do
    allow_any_instance_of(BaseCalculationRule)
      .to receive(:cost).and_return(base_cost)
  end

  it 'calculates #cost' do
    expect(subject.cost(4)).to eq discount_price + base_cost
  end
end
