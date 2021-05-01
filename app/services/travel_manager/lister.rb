module TravelManager
  class Lister
    attr_reader :filters

    def initialize(filters={})
      @filters = filters
    end

    def list
      Travel.all if empty_filters?
    end

    private

    def empty_filters?
      filters.values.all? { |x| x.nil? }
    end
  end
end
