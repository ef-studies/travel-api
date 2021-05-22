module TravelManager
  class Updater
    def initialize(id, params)
      @id = id
      @travel_params = params
    end

    def build
      #binding.pry
      travel = Travel.find(@id)
      travel if travel.update(@travel_params)
    end
  end
end