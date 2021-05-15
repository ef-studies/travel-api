describe TravelsController, type: :controller do

  describe "create" do
    context 'when valid params' do
      result = HTTParty.post("http://localhost:3000/travels", body: { "destination": "cidade de destino" , 
                    "origin": "cidade de origem", "departure_date": "2022-01-01", 
                    "return_date": "2022-12-31" } )

      it { expect(result.code).to eq(200) }
      it { expect(result['destination']).to eq("cidade de destino") }
      it { expect(result['origin']).to eq("cidade de origem") }
      it { expect(result['departure_date'].to_date.strftime("%Y-%m-%d")).to eq("2022-01-01") }
      it { expect(result['return_date'].to_date.strftime("%Y-%m-%d")).to eq("2022-12-31") }
    end

    context 'when invalid params' do
      result = HTTParty.post("http://localhost:3000/travels", body: { "destination": "" , 
                    "origin": "cidade de origem", "departure_date": "2022-01-01", 
                    "return_date": "2022-12-31" } )
  
      it { expect(result.code).to eq(412) }
    end

    context 'without destination attribute' do
      result = HTTParty.post("http://localhost:3000/travels", body: { "origin": "cidade de origem", 
                    "departure_date": "2022-01-01", "return_date": "2022-12-31" } )
  
      it { expect(result.code).to eq(412) }
    end

    context 'when does not send params' do
      result = HTTParty.post("http://localhost:3000/travels", body: { } )
  
      it { expect(result.code).to eq(412) }
    end
  end
end