module TravelManager
  class Lister
    attr_reader :filters

    def initialize(filters={})
      @filters = filters
    end

    def list
      #Travel.all if empty_filters?
      query = {
        #month_eq: @filters[:month],
        departure_date_eq: @filters[:departure_date],
        return_date_eq: @filters[:return_date],
        #locale_eq: @filters[:locale],
        origin_eq: @filters[:origin], 
        destination_eq: @filters[:destination]
      }

      search = Travel.ransack(query)
      search.sorts = ['id desc']
      search.result
    end

    private

#     def empty_filters?
#       filters.values.all? { |filter| filter.nil? }
#     end
  end
end
