describe TravelsController, type: :controller do
  #let!(:object) { create(:travel) }
  #it { expect(object.destination).to eq("cidade de destino") } 
  #it { expect(object.origin).to eq("cidade de origem") }
  #it { expect(object.departure_date.strftime("%Y-%m-%d")).to eq("2022-01-01") }
  #it { expect(object.return_date.strftime("%Y-%m-%d")).to eq("2022-12-31") }

  describe "create" do
    #let(:params) { { destination: object.destination, origin: object.origin, 
                   #departure_date: object.departure_date, return_date: object.return_date }  }
#nao está salvando o body
    HTTParty.post("http://localhost:3000/travels", body: { destination:"cidade de destino" , 
                  origin: "cidade de origem", departure_date: "2022-01-01", 
                  return_date: "2022-12-31" } )
    
    #let(:object2) { Travels.last }

    it { expect(response.code).to eq("200") }
    it { binding.pry }
    it { expect(response.body['destination']).to eq("cidade de destino") }
    it { expect(response.body.origin).to eq("cidade de origem") }
    it { expect(response.body.departure_date.strftime("%Y-%m-%d")).to eq("2022-01-01") }
    it { expect(response.body.return_date.strftime("%Y-%m-%d")).to eq("2022-12-31") }
  end
  
 
end