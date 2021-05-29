module TravelManager
  class Destroyer
    def initialize(id)
      @id = id
    end

    def build
      destroy
    end

    private

    def destroy
      travel = Travel.find(@id)
      travel.destroy
    end
  end
end