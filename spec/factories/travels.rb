FactoryBot.define do
  factory :travel do
    destination { 'cidade de destino' }
    origin { 'cidade de origem' }
    departure_date { '2022-01-01' }
    return_date { '2022-12-31' }
  end
end
