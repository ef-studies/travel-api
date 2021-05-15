class TravelsController < ApplicationController

  def index
    lister = TravelManager::Lister.new(filters)
    render json: lister.list
  end

  def create
    creator = TravelManager::Creator.new(travel_params)
    result = creator.create
    return head :precondition_failed if result.invalid?
    render json: result
  end

  private

  def travel_params
    params.permit(:destination, :origin, :departure_date, :return_date)
  end

  def filters
    {
      month: params[:month],
      departure_date: params[:departure_date],
      return_date: params[:return_date],
      locale: params[:locale],
      origin: params[:origin],
      destination: params[:destination]
    }
  end
end
