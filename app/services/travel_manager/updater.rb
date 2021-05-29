module TravelManager
  class Updater
    def initialize(id, params)
      @id = id
      @travel_params = params
    end

    def build
      update
    end

    private

    def update
      #binding.pry
      travel = Travel.find(@id)
      travel if travel.update(@travel_params)
    end
  end
end