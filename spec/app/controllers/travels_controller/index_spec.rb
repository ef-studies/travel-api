describe TravelsController, type: :controller do
  let!(:travel1) { create(:travel) }
  let(:params) { {} }
  let(:result) { JSON.parse(response.body) }
  before { get 'index', params: params }

  context 'get all travels' do
    it { expect(response.code).to eq("200") }
    it { expect(result.count).to eq(1)}
  end
    
  context 'filter by origin' do
    let(:params) { super().merge({ origin: 'cidade de origem' })}
    it { expect(result.count).to eq(1) }
    
    context 'without searched origin' do
      let!(:travel1) { create(:travel, origin: 'São Paulo') }
      it { expect(result.count).to eq(0) }
    end
  end

  context 'filter by destination' do
    let(:params) { super().merge({ destination: 'cidade de destino' })}
    it { expect(result.count).to eq(1) }
    
    context 'without searched destination' do
      let!(:travel1) { create(:travel, destination: 'São Paulo') }
      it { expect(result.count).to eq(0) }
    end
  end

  context 'filter by departure_date' do
    let(:params) { super().merge({ departure_date: '2022-01-01' })}
    it { expect(result.count).to eq(1) }
    
    context 'without searched departure_date' do
      let!(:travel1) { create(:travel, departure_date: '2022-02-02') }
      it { expect(result.count).to eq(0) }
    end
  end

  context 'filter by return_date' do
    let(:params) { super().merge({ return_date: '2022-12-31' })}
    it { expect(result.count).to eq(1) }
    
    context 'without searched return_date' do
      let!(:travel1) { create(:travel, return_date: '2022-12-30') }
      it { expect(result.count).to eq(0) }
    end
  end
end
