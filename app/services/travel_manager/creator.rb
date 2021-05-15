module TravelManager
  class Creator
    attr_reader :destination, :origin, :departure_date, :return_date

    def initialize(args)
      @destination = args[:destination]
      @origin = args[:origin]
      @departure_date = args[:departure_date]
      @return_date = args[:return_date]
    end

    def create
      Travel.create!(
        {
          destination: destination,
          origin: origin,
          departure_date: departure_date,
          return_date: return_date 
        }
      )
    end
  end
end
