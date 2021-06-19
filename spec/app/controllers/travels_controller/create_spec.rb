describe Api::V0::TravelsController, type: :controller do
  before { post 'create', params: params }
  let(:result) { JSON.parse(response.body) }
  context 'when valid params' do
    let(:params) { 
            { 
              "destination": "cidade de destino" , 
              "origin": "cidade de origem", 
              "departure_date": "2022-01-01", 
              "return_date": "2022-12-31" 
            } }
    it { expect(response.code).to eq("200") }
    it { expect(result['destination']).to eq("cidade de destino") }
    it { expect(result['origin']).to eq("cidade de origem") }
    it { expect(result['departure_date'].to_date.strftime("%Y-%m-%d")).to eq("2022-01-01") }
    it { expect(result['return_date'].to_date.strftime("%Y-%m-%d")).to eq("2022-12-31") }
  end

  context 'when invalid params' do
    let(:params) { 
            { 
              "destination": "" , 
              "origin": "cidade de origem", 
              "departure_date": "2022-01-01", 
              "return_date": "2022-12-31" 
            } }
    it { expect(response.code).to eq("412") }
  end

  context 'without destination attribute' do
    let(:params) { 
            { 
              "origin": "cidade de origem", 
              "departure_date": "2022-01-01", 
              "return_date": "2022-12-31" 
            } }
    it { expect(response.code).to eq("412") }
  end

  context 'when does not send params' do
    let(:params) { {} }

    it { expect(response.code).to eq("412") }
  end

  context 'when params is nil' do
    let(:params) { nil }

    it { expect(response.code).to eq("412") }
  end
end