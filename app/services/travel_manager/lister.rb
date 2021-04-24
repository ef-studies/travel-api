module TravelManager
  class Lister
    attr_reader :filters, :month

    def list
      if month.nil?
       return Travel.all
      else
        Travel.where("cast(strftime('%m', departure_date) as int) = ?", month)
        #TO DO pesquisa com duas colunas ou criar dois filtros? (return_date)
      end
    end

    def initialize(filters)
      @filters = filters
      @month = filters[:month]
    end
  end
end


#Travel.where("cast(strftime('%Y', departure_date) as int) = ?", 2022)