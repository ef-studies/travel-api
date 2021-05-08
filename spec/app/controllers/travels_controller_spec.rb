describe TravelsController, type: :controller do
  let!(:object) { create(:travel) }

  post 

  it { expect(object.destination).to eq("cidade de destino") } 
  it { expect(object.origin).to eq("cidade de origem") }
  it { expect(object.departure_date.strftime("%Y-%m-%d")).to eq("2022-01-01") }
  it { expect(object.return_date.strftime("%Y-%m-%d")).to eq("2022-12-31") } 
end