describe TravelManager::Creator do
  let(:args) { build(:travel) }
  let(:object) { described_class.new(args) }
  let(:result) { object.create }

  describe "#create" do
    context 'when valid params' do
      it { expect(result).to be_persisted }
      it { expect(result.destination).to eq(args.destination) }
      it { expect(result.origin).to eq(args.origin) }
      it { expect(result.departure_date).to eq(args.departure_date) }
      it { expect(result.return_date).to eq(args.return_date) }
    end

    context 'without destination attribute' do
      let(:args) { build(:travel, destination: '') }

      it { expect(result).not_to be_persisted }
    end
  end
end