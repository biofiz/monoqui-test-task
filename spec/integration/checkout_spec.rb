require_relative '../../checkout'

RSpec.describe Checkout do

  let(:rules) do
    {
      A: SpecialCalculationRule.new(50, 3, 130),
      B: SpecialCalculationRule.new(30, 2, 45),
      C: BaseCalculationRule.new(20),
      D: BaseCalculationRule.new(15)
    }
  end

  subject { described_class.new(rules) }

  describe '#total' do
    before do
      goods.split(//).each { |item| subject.scan(item) }
    end

    context "when product list ''" do
      let(:goods) { '' }
      it "returns correct total" do
        expect(subject.total).to eq 0
      end
    end

    context "when product list 'A'" do
      let(:goods) { 'A' }
      it "returns correct total" do
        expect(subject.total).to eq 50
      end
    end

    context "when product list 'AB'" do
      let(:goods) { 'AB' }
      it "returns correct total" do
        expect(subject.total).to eq 80
      end
    end

    context "when product list 'CDBA'" do
      let(:goods) { 'CDBA' }
      it "returns correct total" do
        expect(subject.total).to eq 115
      end
    end

    context "when product list 'AA'" do
      let(:goods) { 'AA' }
      it "returns correct total" do
        expect(subject.total).to eq 100
      end
    end

    context "when product list 'AAA'" do
      let(:goods) { 'AAA' }
      it "returns correct total" do
        expect(subject.total).to eq 130
      end
    end

    context "when product list 'AAAA'" do
      let(:goods) { 'AAAA' }
      it "returns correct total" do
        expect(subject.total).to eq 180
      end
    end

    context "when product list 'AAAAA'" do
      let(:goods) { 'AAAAA' }
      it "returns correct total" do
        expect(subject.total).to eq 230
      end
    end

    context "when product list 'AAAAAA'" do
      let(:goods) { 'AAAAAA' }
      it "returns correct total" do
        expect(subject.total).to eq 260
      end
    end

    context "when product list 'AAAB'" do
      let(:goods) { 'AAAB' }
      it "returns correct total" do
        expect(subject.total).to eq 160
      end
    end

    context "when product list 'AAABB'" do
      let(:goods) { 'AAABB' }
      it "returns correct total" do
        expect(subject.total).to eq 175
      end
    end

    context "when product list 'AAABBD'" do
      let(:goods) { 'AAABBD' }
      it "returns correct total" do
        expect(subject.total).to eq 190
      end
    end

    context "when product list 'DABABA'" do
      let(:goods) { 'DABABA' }
      it "returns correct total" do
        expect(subject.total).to eq 190
      end
    end
  end

  describe '#total increments' do
    it 'returns correct total' do
      expect(subject.total).to eq 0
      subject.scan('A')
      expect(subject.total).to eq 50
      subject.scan('B')
      expect(subject.total).to eq 80
      subject.scan('A')
      expect(subject.total).to eq 130
      subject.scan('A')
      expect(subject.total).to eq 160
      subject.scan('B')
      expect(subject.total).to eq 175
    end
  end
end
