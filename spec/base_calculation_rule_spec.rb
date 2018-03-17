require_relative '../base_calculation_rule'

RSpec.describe BaseCalculationRule do

  subject { described_class.new(base_price) }

  let(:base_price) { 100 }

  it 'calculates #amount_per_position correctly' do
    expect(subject.amount_per_position(3)).to eq base_price * 3
  end
end
