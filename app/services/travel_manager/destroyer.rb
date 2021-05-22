module TravelManager
  class Destroyer
    def initialize(id)
      @id = id
    end

    def build
      travel = Travel.find(@id)
      travel.destroy
    end
  end
end